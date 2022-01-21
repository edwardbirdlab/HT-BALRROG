#!/usr/bin/env nextflow
/*
========================================================================================
                         edwardbirdlab/BARA
========================================================================================
 Bacterial Antimicroal Resistance Annoation Pipeline.
 #### Find information at:
 https://github.com/edwardbirdlab/BARA
----------------------------------------------------------------------------------------
*/


def helpMessage() {
    //log.info
    log.info"""
    add instructions here
    """.stripIndent()
}


// Show help emssage
if (params.help){
    helpMessage()
    exit 0
}

nextflow.enable.dsl=2

/* Temp while testing */

out_dir = "./nextflow_out"
project_name = "test_1"
thread_max = "19"
input_folder = "./test_fq"
file_glob = "*_[1,2].fq.gz"
includeConfig = "./configs/nxtflow.cfg"

fastqs = Channel.fromFilePairs("${input_folder}/${file_glob}")



include { fastqc as raw_fqc } from './modules/Initial_QC/fastqc.nf'

workflow {
  take fastqs
  take out_dir
  take project_name
  take thread_max
  raw_fqc(fastqs)
}