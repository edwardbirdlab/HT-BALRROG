process KRAKEN2_OUT_CONVERT {
    label 'lowmem'
    container 'quay.io/biocontainers/python:3.9--1'
    publishDir "${params.project_name}/Assembly/kraken2/${sample}", mode: 'copy', overwrite: false


    input:
        tuple val(sample), file(out)

    output:
        tuple val(sample), path("*blobtools.tsv"), emit: for_blob
        tuple val(sample), path("*classed.tsv"), emit: classified


    script:

    """
    kraken2_out2blob.py ${out}
    """
}