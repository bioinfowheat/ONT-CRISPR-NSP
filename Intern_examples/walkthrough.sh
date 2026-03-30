
# login

# get data
mkdir fastqdata
cd fastqdata/
cp /mnt/griffin/4interns/combined_fastq_files/barcode0*.combined.fastq.gz .
ls
mkdir rawQC

# run one
fastqc -o rawQC/ -t 2 barcode01.combined.fastq.gz
# run all
fastqc -o rawQC/ -t 10 *.combined.fastq.gz

cd rawQC/
ls
ls -lh


#

scp grenik@duke.zoologi.su.se:/mnt/griffin/grenik/fastqdata/rawQC/\*.html .


