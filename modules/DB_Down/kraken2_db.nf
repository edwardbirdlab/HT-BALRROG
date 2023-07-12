process kraken2_db {
    label 'small'
    output:
        tuple val('kracken_db'), path("inspect.txt"), path('k2_standard_16gb_20230605.tar.gz'), emit: kraken2_DB

    script:

    """
    wget https://genome-idx.s3.amazonaws.com/kraken/standard_16gb_20230605/inspect.txt
    wget https://genome-idx.s3.amazonaws.com/kraken/k2_standard_16gb_20230605.tar.gz
    """
}