#!/usr/bin/env nextflow
/*
========================================================================================
                ingestion
========================================================================================
 ingestion Analysis Pipeline.
 #### Homepage / Documentation
 https://git.dcc.sib.swiss/nds-lucid/ingestion
----------------------------------------------------------------------------------------
*/

/*
 * SET UP CONFIGURATION VARIABLES
 */

 nextflow.enable.dsl = 2

// Import modules

include { validation } from './modules/validation'
include { rdf_to_nt as instances_to_nt; rdf_to_nt as shapes_to_nt; bundle_rdf } from './modules/rdf'
include { cat_files; sett_unpack; unpack; md5sum; send_notification; compress; extract_by_extension; get_sett_metadata; check_integrity} from './modules/io'

// Define input and output folders

shapes = file(params.shapes, checkIfExists: true)
ontology = file(params.ontology, checkIfExists: true)
terminologies = Channel.fromPath("${params.terminology_folder}/*ttl")

// Function to split a list into a 2: one with the size that is multiple of the buffer, the other with the rest
def splitList(inputList, bufferSize) {
  def partitionIndex = inputList.size() - (inputList.size() % bufferSize)
  def batchable = inputList[0..<partitionIndex]
  def leftovers = inputList[partitionIndex..-1]
  return [batchable, leftovers]
}

// Functions for edge cases where a single path is turned into a long string without a separator
def check_size(inputList) {
  if (inputList instanceof Path) {
    return inputList
  }
  else {
    return inputList.toUnique().join("")
  }
}

// Define workflow

workflow {
  if (params.rerun){
    // Define another channel to re-execute the pipeline for existing files
    ch_sett_pkg = Channel.fromPath("${params.input_dir}*.zip")
  }
  else {
    // Define a channel to trigger execution for sett packages arriving
    ch_sett_pkg = Channel.watchPath("${params.input_dir}*.zip")
  }

  // Unpack sett package if decrypt is true, otherwise simply unzip
  if (params.decrypt) {
    ch_pkg_ready = check_integrity(ch_sett_pkg)
    ch_sett_pkg_metadata = get_sett_metadata(ch_pkg_ready)
      .map{ it -> [it[0], it[1].readLines()[0]] }
    ch_patient_folder = sett_unpack(ch_sett_pkg_metadata)
    ch_patient_dataset = extract_by_extension(ch_patient_folder, params.input_rdf_ext)
  }
  else {
    ch_pkg_ready = check_integrity(ch_sett_pkg)
    ch_patient_folder = unpack(ch_pkg_ready)
    ch_patient_dataset = extract_by_extension(ch_patient_folder, params.input_rdf_ext)
  }
  
  // Combine ontology with external terminologies
  all_resources = Channel.from(ontology)
    .concat(terminologies)
  
  // Convert enriched terminologies to nt
  enriched_terminologies = cat_files(
    shapes_to_nt(all_resources).collect(),
    file("enriched_terminologies.nt")
  )

  // For watchPath compatibility, we need to branch the leftovers from the buffer
  ch_patient_dataset
    .multiMap{ it -> 
      chunks: splitList(it, params.buffer_size)[0]
      leftovers: splitList(it, params.buffer_size)[1]}
    .set{ pre_batches }

  // Batch patients and use md5 to identify each batch, keep the original parent directory
  pre_batches.chunks.flatten()
    .buffer(size: params.buffer_size, remainder: false)
    .map {it -> [it , it.join("").md5(), it.parent.toUnique().join("") ]}
    .set{ batches_part1 }
  
  // Repeat the process for leftovers
  pre_batches.leftovers.flatten()
    .map {it -> [it , it.join("").md5(), check_size(it.parent) ]}
    .set{ batches_part2 }

  // mix is the only operator compatible with watchPath (join stalls and concat outputs only first channel)
  batches_part2
    .mix(batches_part1)
    .set { batches }

  // Bundle patient batches and enriched terminologies
  bundled_batches = bundle_rdf(batches, enriched_terminologies)

  // Validate patient data against SPHN SHACL shapes after unzipping
  validation_result = validation(bundled_batches, shapes)

  // Use the exit status to define valid and invalid data
  // EXIT STATUS 1: invalid data (or if file is empty)
  // EXIT STATUS 0: valid data
  validation_result.status
    .branch{
      invalid: it[2] == "1" || it[0].size() == 0
      valid: true
    }
    .set { classified_patients }

  // For invalid data send notification
  md5 = md5sum(classified_patients.invalid)
  send_notification(md5, "${params.notification_dir}")

  // For valid data, convert to nt and compress data to output folder
  valid_patient_files = classified_patients.valid.map { it[0] }
  patient_nt = instances_to_nt(valid_patient_files)
  // We create a file in the output directory without the md5sum in the name
  // This way all bundles will be compressed into the same file
  valid_patient_files
    .map { file("${params.output_dir}${it.simpleName.replaceAll(/_.*/, '')}.nt.gz") }
    .set { output_file }
  compress(patient_nt, output_file)

}

workflow.onError{
  println "Error: ${workflow.errorMessage}"
  println "Error: ${workflow.errorReport}"
}
