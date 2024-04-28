/*
This File contains parameters that can be changed to configure the pipeline
*/



params.sample_sheet = '/set/path/to/samplesheet/here'
params.project_name = 'BALROG_MON_RUN_1'
params.workflow_opt = 'ont_meta'

/* Other program Settings */
params.fastp_q = '20'
params.fastp_adap1 = ''
params.fastp_adap2 = ''
params.plasmer_min_len = '500'           //==  Setting the minimum size to be classified in plasmer (defualt/recommended = 500)
params.plasmer_max_len = '500000'        //==  Setting the length at which all contigs greater than this size are automatically considered chromomosomal in orgin (defualt = 500000)

/*
Database Settings (True = autodownload, False = supplied in corresponding folder)
*/

params.database_dir = ''

//Plasmer (recommend autodownload)
params.db_plasmer = true

//Kracken2 (recommend autodownload) If different database is used change RAM requirements as needed in config
params.db_kraken2 = true

//ViralVerify_pfam_db (Can be updated for more up to date plasmid searching, dependent on use)
params.db_viralverify = true

//GTDBtk (Can be updated for more up to date genome identification)
params.db_gtdbtk = true

//ViralVerify_pfam_db (Can be updated for more up to date plasmid searching, dependent on use)
params.db_ncbi16S = true

//resfinder (Reccomend updating for most up to date ARGs)
params.db_resfinder = true

//amrfinder (Reccomend updating for most up to date ARGs)
params.db_amrfinder = true

//argannot (Reccomend updating for most up to date ARGs)
params.db_argannot = true

//card (Reccomend updating for most up to date ARGs)
params.db_card = true

//megares (Reccomend updating for most up to date ARGs)
params.db_megares = true

//Kracken2 PlusPF for metagenomic community anlysis (recommend autodownload) If different database is used change RAM requirements as needed in config
params.db_kraken2_pluspf = true

//Kracken2 PlusPF for metagenomic community anlysis (recommend autodownload) If different database is used change RAM requirements as needed in config
params.db_virsorter = true

//Krackenuniq database for pathogen detection anlysis (recommend autodownload) If different database is used change RAM requirements as needed in config
params.db_krakenuniq = true



/*
Which Path to take (read options carefully):
*/

//Perform metagenomic assembly on ONT reads == True, Convert reads to Fasta without Assembly == False
params.ont_metagenomic_assembly = false



/*
Optional Steps Settings (True = Run Aditional Step, False = Don't run it):
*/

//Preform metagenomic community analysis against GTDB with Sylph (Uses metaphlan scripts for analsysis)
params.meta_community_analysis =true

//Preform extra taxonomic classification (Kraken2 & GTDB) of sequences (Metagenome Recommend, but can be used on Fq2Fa samples as well) 
params.meta_sequence_id = false

//Preform CARD database only annotation. If this is true multi_amr should be false.
params.card_only = false

//Preform multi amr database annoation (AMRFINDERPLUS,Resfinder,CARD). If this is true card_only should be false
params.multi_amr = true

//Preform mobile element finder, will also look to see if any AMR genes happend to be on mobile elements (plasmer already does plasmid, and is run by defualt.
//This should be used if you are intrested in other ME types)
params.mef = true

//Preform proka - metagenome annotator. Will annotate out any genes from the metagenome. This pipeline will not summarize these findings in any way
params.proka = true

//Preform pathogen detection - kraken2 will be run to look for pathogens in host-depleted reads
params.pathogen_detection = true




//Old Unused setting - Ignore 

params.chdit_ident = '0.95'
params.chdit_word_size = '8'
params.bacscan_nhmm_eval = '0.000001'
params.bacscan_hmm_eval = '0.000001 '

params.min_contig_size = '500'           //==  combined with coverage to filter out small lov cov contigs (Outdated, dosent preform anymore)
params.min_contig_cov = '2'              //==  conbined with size to filter out small lov cov contigs