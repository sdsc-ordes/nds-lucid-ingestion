// Concatenate a list of input files.
process cat_files {

    input:
    val(fileList)
    path output

    output:
    path("$output")

    script:
        files = fileList.join(' ')
    """
    cat ${files} > ${output}
    """

}
// Decrypt and decompress incoming packages
process sett_unpack {
    secret 'SETT_OPENPGP_KEY_PWD'

    input:
    tuple path(sett_package), val(new_name)

    output:
    path("${new_name}")

    script:
    """
    sett-cli decrypt -p \$SETT_OPENPGP_KEY_PWD $sett_package
    mv ${sett_package.baseName} ${new_name}
    """

}

process get_sett_metadata {

    input:
    path sett_package

    output:
    tuple path("${sett_package}"), path("${sett_package.baseName}_metadata.txt")

    script:
    """
    # Extract all necessary information from sett's metadata.json
    SENDER=\$(unzip -p ${sett_package} metadata.json | jq -r '.["sender"]')
    INSTITUTE=\$(sett-cli keys list | grep \$SENDER | cut -d"@" -f2 | cut -d"." -f1)
    DATE=\$(unzip -p ${sett_package} metadata.json | jq -r '.["timestamp"]'| sed 's/[-:+]//g')
    echo -n "\${DATE}_\$INSTITUTE" > ${sett_package.baseName}_metadata.txt
    """

}

process check_integrity {

    input:
    path sett_package

    output:
    path sett_package

    script:
    """
    i=0
    max=1000
    while [ \$i -lt \$max ]
    do
        # go to extraction if zip file is valid
        if unzip -t "${sett_package}" > /dev/null 2>&1; then
            break
        fi
    done
    """
}

// Decompress incoming packages
process unpack {

    input:
    path sett_package

    output:
    path("$sett_package.baseName")

    script:
    """
    unzip -od $sett_package.baseName $sett_package
    """
}

// compute md5 sum of patient data

process md5sum {

    input:
    tuple path(patient_data), path(error_file), val(stdout)

    output:
    tuple stdout, path(error_file), val(stdout)

    script:
    """
    md5sum $patient_data | cut -f1 -d" " | head -c -1
    """
}

// Recursively unzip archives and gather extracted
// files with desired extension in base folder.

process extract_by_extension {

    input:
    path extracted_folder
    val(suffix)

    output:
    path("$extracted_folder/*.ttl")

    script:
    """
    SKIP_DIR="*not_ok*"
    # Find zip files and uncompress recursively
    fdfind . $extracted_folder -E "\${SKIP_DIR}" -e zip -x unzip -od {.} {}
    # Find files with desired extension and move them to a flat folder
    fdfind . $extracted_folder -E "\${SKIP_DIR}" -e $suffix -x mv {} $extracted_folder
    """

}

// Send notification with information about files that didn't pass checks
process send_notification {

    input:
    tuple val(md5), path(error_file), val(stdout)
    path notification_folder

    output:
    path "$notification_folder/${error_file}_errors.txt"

    script:
    if( stdout=="1" )
        """
        # Remove all md5sums from the file name to have one error file per incoming package
        echo $md5'\t'validation_error >> $notification_folder/${error_file.name.replaceAll(/_\d+(?=\.\w+$)/, '')}_errors.txt 
        """
    else
        """
        echo $md5'\t'empty >> $notification_folder/${error_file.name}_errors.txt
        """
}

// Compress with gzip
process compress {
    //publishDir "${params.output_dir}", mode: 'move'

    input:
    path valid_patients
    path output_file

    output:
    path output_file

    script:
    """
    gzip -c $valid_patients >> $output_file
    """
}
