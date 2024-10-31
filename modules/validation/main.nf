
// Validate data using the SHACL API container
process validation {
    errorStrategy 'ignore'

    input:
    tuple path(instance_data), path(output_dir)
    path shacl_shapes

    output:
    tuple path(instance_data), path(output_dir), stdout, emit: status
    path("$output_dir/${instance_data.baseName}_report.ttl"), emit: report


    script:
    """
    shaclvalidate.sh -datafile $instance_data -shapesfile $shacl_shapes > $output_dir/${instance_data.baseName}_report.ttl || echo -n \$?
    """
}