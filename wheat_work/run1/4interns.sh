
# just pasted fasta file into 4interns folder
# need to chang permissions
sudo chown :general -R /mnt/griffin/4interns
sudo chmod 550 -R /mnt/griffin/4interns



cd 4interns
cp -r run1_fastq_files/ ../4interns/

# make this generally accessible to them.
sudo cp -r 4interns /mnt/griffin/
sudo chown :general -R /mnt/griffin/4interns
sudo chmod 550 -R /mnt/griffin/4interns

