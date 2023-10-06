/*
~~~~~~~~~~~~~~~~~~~~~~
Importing subworkflows
~~~~~~~~~~~~~~~~~~~~~~
*/

include { READ_QC as READ_QC } from '../subworkflows/READ_QC.nf'
include { SHORT_READ_ISOLATE_ASSEMBLY as SHORT_READ_ISOLATE_ASSEMBLY } from '../subworkflows/SHORT_READ_ISOLATE_ASSEMBLY.nf'
include { PLASMID_PREDICTION as PLASMID_PREDICTION } from '../subworkflows/PLASMID_PREDICTION.nf'
include { FUNCTIONAL_ANNOTATION as FUNCTIONAL_ANNOTATION } from '../subworkflows/FUNCTIONAL_ANNOTATION.nf'
include { ASSEMBLY_QC as ASSEMBLY_QC } from '../subworkflows/ASSEMBLY_QC.nf'
include { IDENTIFICATION as IDENTIFICATION } from '../subworkflows/IDENTIFICATION.nf'
include { ARG_GET_DBS as ARG_GET_DBS } from '../subworkflows/ARG_GET_DBS.nf'
include { CUSTOM_ARG_DB as CUSTOM_ARG_DB } from '../subworkflows/CUSTOM_ARG_DB.nf'
include { HOST_REMOVAL_SHORT_READ as HOST_REMOVAL_SHORT_READ } from '../subworkflows/HOST_REMOVAL_SHORT_READ.nf'

workflow SHORT_READ_METAGENOMIC {
    take:
        fastqs_short_raw      //    channel: [val(sample), [fastq_1, fastq_2]]
        host_gen_fasta        //    channel: fna

    main:
        READ_QC(fastqs_short_raw)

        HOST_REMOVAL_SHORT_READ(READ_QC.out.trimmed_fastq, host_gen_fasta)

//        SHORT_READ_ISOLATE_ASSEMBLY()
        
//        PLASMID_PREDICTION(SHORT_READ_ISOLATE_ASSEMBLY.out.unclassed_genome)

//        ASSEMBLY_QC(PLASMID_PREDICTION.out.all, READ_QC.out.trimmed_fastq)

//        FUNCTIONAL_ANNOTATION(PLASMID_PREDICTION.out.all)

//        IDENTIFICATION(PLASMID_PREDICTION.out.chromosomal)

//        ARG_GET_DBS()

//        CUSTOM_ARG_DB(ARG_GET_DBS.out.all_fa)



}