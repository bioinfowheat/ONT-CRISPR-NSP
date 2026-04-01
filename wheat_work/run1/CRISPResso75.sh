
cd /mnt/griffin/chrwhe/ONT_testing/espresso75
cp /mnt/griffin/4interns/combined_fastq_files/*gz .
parallel 'unpigz {}' ::: *.gz 

# install 
micromamba create -n crispresso2_env -c conda-forge -c bioconda crispresso2
# activate installation
micromamba activate crispresso2_env
# note, when you are done you can type
micromamba deactivate

# file names
barcode01.combined.fastq

# can I list them easily
for x in {01..75}; do
    echo "barcode$x" "barcode$x.combined.fastq"
done | tr " " "\t" > NSPbatch75.batch

# add a header to the batch file
nano NSPbatch75.batch
name    fastq_r1
barcode01       barcode01.run1.fastq
barcode02       barcode02.run1.fastq

# batch run on raw fastq data
CRISPRessoBatch --batch_settings NSPbatch75.batch --amplicon_seq ACGAAAAGTCATGGCAAGTCATAGAAAGATCGCGAAAAATACTAATTAATGATTTTGAAAATGATAGGATCTGATTGTTTCCTTGATAACATTTGAATATATAAACTCGACACCTGTGAAATAAATCAATTAACACTAATAAAATGAAAGGTGTTGTAGTCTTCTTAGCCCTCGCGGCTTTGGGGAGCGCTAAGCCTCGTCTGTTCGAGACGTTCCAAGACCACTTTCAACACTTTTTGGACATAAGCAATGCCTTGGAGGGTGCCCATTGGAGACGACAACAGGGTCAGGGGTACACTCCTAACCCAGAATACATCGAAATGTTGAACAAGCTGAGCGAGCAAAACTTGAAACAGATGCTCGCTGATTTAAAAAAGGAGCCTGAAGTGCAAGACGTGAGTACCTTATACATTTATATACTAGCCTCAAAATTGTTTGAAATAAATATTTTTACAAAGAATAACTGATTCGATTTGGACATTGCACAACCTCGTT -p 40 -g CTTCTTAGCCCTCGCGGCTTTGG -wc -3 -w 10 --zip_output --plot_window_size 30 --place_report_in_output_folder

scp chrwhe@duke.zoologi.su.se:/mnt/griffin/chrwhe/ONT_testing/espresso75/CRISPRessoBatch_on_NSPbatch75.zip .

########
# batch run on 2nd version of fastp cleaning
# refresh my memmory
cd fp2_clean
cp /mnt/griffin/4interns/combined_fastq_files/*gz .
ls *| cut -f1 -d '.' > 75barcodes

# how were these cleaned?
cat 75barcodes | parallel -j 13 '../../software/fastp/fastp --in1 {}.combined.fastq.gz \
  --out1 fastp_second_run/{}.combined.trimmed2.fastq.gz \
  --average_qual 10 \
  --length_required 100 \
  --disable_adapter_trimming \
  --thread 4 \
  --html fastp_second_run/{}.run2.html \
  --json fastp_second_run/{}.run2.json \
  --disable_length_filtering \
  --cut_front --cut_right \
  --cut_front_window_size 10 --cut_right_window_size 10 \
  --cut_front_mean_quality 10 --cut_right_mean_quality 10 '

# OK, now I know what I have, so make new folder
mkdir espresso75_fp2
# go into it
cd espresso75_fp2
# get new clean reads into it
cp ../fp2_clean/*.gz .

# make new batch file based upon the new fastq names
for x in {01..75}; do
    echo "barcode$x" "barcode$x.combined.trimmed2.fastq.gz"
done | tr " " "\t" > NSPbatch75.trimmed.batch

# add as header, must be tab separated
name    fastq_r1

# run
CRISPRessoBatch --batch_settings NSPbatch75.trimmed.batch --amplicon_seq ACGAAAAGTCATGGCAAGTCATAGAAAGATCGCGAAAAATACTAATTAATGATTTTGAAAATGATAGGATCTGATTGTTTCCTTGATAACATTTGAATATATAAACTCGACACCTGTGAAATAAATCAATTAACACTAATAAAATGAAAGGTGTTGTAGTCTTCTTAGCCCTCGCGGCTTTGGGGAGCGCTAAGCCTCGTCTGTTCGAGACGTTCCAAGACCACTTTCAACACTTTTTGGACATAAGCAATGCCTTGGAGGGTGCCCATTGGAGACGACAACAGGGTCAGGGGTACACTCCTAACCCAGAATACATCGAAATGTTGAACAAGCTGAGCGAGCAAAACTTGAAACAGATGCTCGCTGATTTAAAAAAGGAGCCTGAAGTGCAAGACGTGAGTACCTTATACATTTATATACTAGCCTCAAAATTGTTTGAAATAAATATTTTTACAAAGAATAACTGATTCGATTTGGACATTGCACAACCTCGTT -p 50 -g CTTCTTAGCCCTCGCGGCTTTGG -wc -3 -w 10 --zip_output --plot_window_size 30 --place_report_in_output_folder

# get to local computer to look at the html file
scp chrwhe@duke.zoologi.su.se:/mnt/griffin/chrwhe/ONT_testing/espresso75_fp2/CRISPRessoBatch_on_NSPbatch75.trimmed.zip .


