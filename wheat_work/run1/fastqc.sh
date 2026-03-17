# FastQC
chmod 777 /mnt/griffin/chrwhe/software/fastqc

# make the output folder
mkdir results
# then run
/mnt/griffin/chrwhe/software/FastQC/fastqc run1_fastq_files/*.fastq.gz -o results --threads 10
# results folder is now full of HTML files

# zip these
zip raw_fastqc.zip *html
# download to your local computer to view
scp chrwhe@duke.zoologi.su.se:/mnt/griffin/chrwhe/ONT_testing/results/raw_fastqc.zip .
