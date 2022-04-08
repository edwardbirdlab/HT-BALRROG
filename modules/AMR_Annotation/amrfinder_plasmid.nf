process amrfinder_plasmid {
   label 'lowmem'
    container 'staphb/ncbi-amrfinderplus'
    containerOptions = "--user root"
    publishDir "${params.project_name}/AMRFinder_plasmid", mode: 'copy', overwrite: false

    input:
        tuple val(sample), file(fasta)
    output:
        path("./${sample}_AMRFinder.tsv"), emit: amrfinder_plasmid_results

    script:

    """
    amrfinder -n ${fasta} -o ${sample}_AMRFinder.tsv
    """
}