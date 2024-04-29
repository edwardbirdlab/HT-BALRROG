process KRAKEN_REPORT2KRONA {
    label 'lowmem'
	container 'ebird013/braken:2.9'
    publishDir "${params.project_name}/Kraken2_Krona/${sample}/${task.process}", mode: 'copy', overwrite: true

    input:/${task.process}
        tuple val(sample), file(report)
    output:
	   tuple val(sample), path("${sample}.krona"), path("${sample}.krona.html"), emit: krona

    script:

    """
    kreport2krona.py -r ${report} -o ${sample}.krona
    ktImportText ${sample}.krona -o ${sample}.krona.html
    """
}