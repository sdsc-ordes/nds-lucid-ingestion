// Convert RDF files to ntriples format.
process rdf_to_nt {
    label 'rdf_conversion'

    input:
    path(ttl_file)

    output:
    path("${ttl_file.baseName}.nt")

    script:
    """
    riot \
      --output=ntriples \
      ${ttl_file} \
      > ${ttl_file.baseName}.nt
    """
}

// Bundle RDF files and terminologies into a single ttl file.

process bundle_rdf {
    label 'rdf_conversion'
    
    input:
    tuple path(rdf_files), val(bundle_name), path(output_dir)
    path(terminologies)

    output:
    tuple path("${output_dir.simpleName}_${bundle_name}.ttl"), path(output_dir)
    """
    riot \
      --output=turtle \
      ${rdf_files} \
      ${terminologies} \
      > ${output_dir.simpleName}_${bundle_name}.ttl
    """

}