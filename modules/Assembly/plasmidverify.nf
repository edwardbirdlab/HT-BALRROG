process plasmidverify {
    container 'plasmidverify:1.0'
    containerOptions = "--user root"
    publishDir "${params.project_name}/plasmid_verify", mode: 'copy', overwrite: false

    input:
        tuple val(sample), file(fasta)
        path(DB)
    output:
        path("${sample}/*"), emit: out_dir

    script:

    """
    plasmidverify.py -f ${fasta} -o ${sample} --hmm ${DB} -t ${params.thread_max}
    """
}