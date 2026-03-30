
cd /mnt/griffin/chrwhe/ONT_testing/espresso75
cp /mnt/griffin/4interns/combined_fastq_files/*gz .
parallel 'unpigz {}' ::: *.gz 

micromamba activate crispresso2_env

# files
barcode01.combined.fastq

for x in {01..75}; do
    echo "barcode$x" "barcode$x.combined.fastq"
done | tr " " "\t" > NSPbatch75.batch

nano NSPbatch75.batch
name    fastq_r1
barcode01       barcode01.run1.fastq
barcode02       barcode02.run1.fastq

# batch run 
CRISPRessoBatch --batch_settings NSPbatch75.batch --amplicon_seq ACGAAAAGTCATGGCAAGTCATAGAAAGATCGCGAAAAATACTAATTAATGATTTTGAAAATGATAGGATCTGATTGTTTCCTTGATAACATTTGAATATATAAACTCGACACCTGTGAAATAAATCAATTAACACTAATAAAATGAAAGGTGTTGTAGTCTTCTTAGCCCTCGCGGCTTTGGGGAGCGCTAAGCCTCGTCTGTTCGAGACGTTCCAAGACCACTTTCAACACTTTTTGGACATAAGCAATGCCTTGGAGGGTGCCCATTGGAGACGACAACAGGGTCAGGGGTACACTCCTAACCCAGAATACATCGAAATGTTGAACAAGCTGAGCGAGCAAAACTTGAAACAGATGCTCGCTGATTTAAAAAAGGAGCCTGAAGTGCAAGACGTGAGTACCTTATACATTTATATACTAGCCTCAAAATTGTTTGAAATAAATATTTTTACAAAGAATAACTGATTCGATTTGGACATTGCACAACCTCGTT -p 40 -g CTTCTTAGCCCTCGCGGCTTTGG -wc -3 -w 10 --zip_output --plot_window_size 30 --place_report_in_output_folder

scp chrwhe@duke.zoologi.su.se:/mnt/griffin/chrwhe/ONT_testing/espresso75/CRISPRessoBatch_on_NSPbatch75.zip .


cd fp2_clean
cp /mnt/griffin/4interns/combined_fastq_files/*gz .
ls *| cut -f1 -d '.' > 75barcodes

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

# clead up, removed raw files, etc


cd espresso75_fp2
cp ../fp2_clean/*.gz .

for x in {01..75}; do
    echo "barcode$x" "barcode$x.combined.trimmed2.fastq.gz"
done | tr " " "\t" > NSPbatch75.trimmed.batch

# add as header, must be tab separated
name    fastq_r1

# run
CRISPRessoBatch --batch_settings NSPbatch75.trimmed.batch --amplicon_seq ACGAAAAGTCATGGCAAGTCATAGAAAGATCGCGAAAAATACTAATTAATGATTTTGAAAATGATAGGATCTGATTGTTTCCTTGATAACATTTGAATATATAAACTCGACACCTGTGAAATAAATCAATTAACACTAATAAAATGAAAGGTGTTGTAGTCTTCTTAGCCCTCGCGGCTTTGGGGAGCGCTAAGCCTCGTCTGTTCGAGACGTTCCAAGACCACTTTCAACACTTTTTGGACATAAGCAATGCCTTGGAGGGTGCCCATTGGAGACGACAACAGGGTCAGGGGTACACTCCTAACCCAGAATACATCGAAATGTTGAACAAGCTGAGCGAGCAAAACTTGAAACAGATGCTCGCTGATTTAAAAAAGGAGCCTGAAGTGCAAGACGTGAGTACCTTATACATTTATATACTAGCCTCAAAATTGTTTGAAATAAATATTTTTACAAAGAATAACTGATTCGATTTGGACATTGCACAACCTCGTT -p 50 -g CTTCTTAGCCCTCGCGGCTTTGG -wc -3 -w 10 --zip_output --plot_window_size 30 --place_report_in_output_folder

scp chrwhe@duke.zoologi.su.se:/mnt/griffin/chrwhe/ONT_testing/espresso75_fp2/CRISPRessoBatch_on_NSPbatch75.trimmed.zip .


