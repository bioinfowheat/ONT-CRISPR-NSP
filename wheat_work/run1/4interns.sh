
# just pasted fasta file into 4interns folder
# need to chang permissions
sudo chown :general -R /mnt/griffin/4interns
sudo chmod 550 -R /mnt/griffin/4interns

#
cd 4interns
cp -r /mnt/griffin/chrwhe/ONTdata/run1_fastq_pass/combined_fastq_files/ .

# make this generally accessible to them.
sudo cp -r 4interns /mnt/griffin/
sudo chown :general -R /mnt/griffin/4interns
sudo chmod 550 -R /mnt/griffin/4interns

cp /mnt/griffin/chrwhe/ONTdata/run2_fastq_files/combined_fastq_files/*.gz /mnt/griffin/chrwhe/ONTdata/4interns/combined_fastq_files

sudo cp -r /mnt/griffin/chrwhe/ONTdata/4interns /mnt/griffin/
sudo chown :general -R /mnt/griffin/4interns
sudo chmod 550 -R /mnt/griffin/4interns
