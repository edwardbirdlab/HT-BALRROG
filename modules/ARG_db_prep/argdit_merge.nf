process argdit_merge {
    label 'lowmem'
    container 'library://edwardbirdlab/bara/argdit:1.0'
    publishDir "${params.project_name}/argdit_merge", mode: 'copy', overwrite: false

    input:
        tuple val(config_val), path(argdit_config)
        tuple file(db_1), file(db_2), file(db_3), file(db_4)


    output:
        tuple val('merge_db'), path('*.log'), emit: log
        tuple val('merge_db'), path('arg_merge_db.fasta'), emit: merge_db
        path('arg_merge_db.fasta'), emit: only_merge_db


    
        
    script:

    """
    cp -R /opt/ARGDIT .
    cd ARGDIT
    rm -rf config.ini
    cp ../config.ini .
    cd ..
    ./ARGDIT/merge_arg_db.py -a -p -e *.fasta -o arg_merge_db.fasta
    """
}