# go to your local folder.
# you must always do this, as this is the location where you save your work

replace USERNAME below with your account user name.
mine is chrwhe, so watch what I do 

cd /mnt/griffin/USERNAME

# my work
cd /mnt/griffin/chrwhe
# make a new folder for this work, call it whatever you want
mkdir ONT_testing
# go into this folder
cd ONT_testing
# copy the read data to your folder
cp -r /mnt/griffin/4interns/run1_fastq_files .

# look what you did
cd run1_fastq_files/
ls
# barcode01.run1.fastq.gz  barcode05.run1.fastq.gz  barcode09.run1.fastq.gz  barcode13.run1.fastq.gz  barcode17.run1.fastq.gz  barcode21.run1.fastq.gz
# barcode02.run1.fastq.gz  barcode06.run1.fastq.gz  barcode10.run1.fastq.gz  barcode14.run1.fastq.gz  barcode18.run1.fastq.gz  barcode22.run1.fastq.gz
# barcode03.run1.fastq.gz  barcode07.run1.fastq.gz  barcode11.run1.fastq.gz  barcode15.run1.fastq.gz  barcode19.run1.fastq.gz  barcode23.run1.fastq.gz
# barcode04.run1.fastq.gz  barcode08.run1.fastq.gz  barcode12.run1.fastq.gz  barcode16.run1.fastq.gz  barcode20.run1.fastq.gz  barcode24.run1.fastq.gz

# get your genomic reference
cp /mnt/griffin/4interns/NSP_region_PCR_sgRNA_genomicDNA.fasta .

# look at the fasta file
head NSP_region_PCR_sgRNA_genomicDNA.fasta 
>NC_059669.1:14882048-14885601 Pieris brassicae chromosome 5, ilPieBrab1.1, whole genome shotgun sequence
GCGATAAAATAAAAACTTCAAGAAGATAAGGTAGTTAAGATGACTTTTAATAAATACGAAAAGTCATGGCAAGTCATAGAAAGATCGCGAAAAATACTAATTAATGATTTTGAAAATGATAGGATCTGATTGTTTCCTTGATAACATTTGAATATATAAACTCGACACCTGTGAAATAAATCAATTAACACTAATAAAATGAAAGGTGTTGTAGTCTTCTTAGCCCTCGCGGCTTTGGGGAGCGCTAAGCCTCGTCTGTTCGAGACGTTCCAAGACCACTTTCAACACTTTTTGGACATAAGCAATGCCTTGGAGGGTGCCCATTGGAGACGACAACAGGGTCAGGGGTACACTCCTAACCCAGAATACATCGAAATGTTGAACAAGCTGAGCGAGCAAAACTTGAAACAGATGCTCGCTGATTTAAAAAAGGAGCCTGAAGTGCAAGACGTGAGTACCTTATACATTTATATACTAGCCTCAAAATTGTTTGAAATAAATATTTTTACAAAGAATAACTGATTCGATTTGGACATTGCACAACCTCGTTCATAAAGGAGACTGTAGAATCACGGAATATGTTAATAGTGAGTCTTGTGTATAAAAAGCAACTGAAACTTACTTCAACCATAACGCGATTGGCTCGATGTGTGTGGAAGGCAAATCACAAATAAAATTCAAGTCAAATTTACAAAATAT
>ref|XM_045660935.1|:1-276 PREDICTED: Pieris brassicae uncharacterized LOC123709534 (LOC123709534), mRNA
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ATGAAAGGTGTTGTAGTCTTCTTAGCCCTCGCGGCTTTGGGGAGCGCTAAGCCTCGTCTGTTCGAGACGTTCCAAGACCACTTTCAACACTTTTTGGACATAAGCAATGCCTTGGAGGGTGCCCATTGGAGACGACAACAGGGTCAGGGGTACACTCCTAACCCAGAATACATCGAAATGTTGAACAAGCTGAGCGAGCAAAACTTGAAACAGATGCTCGCTGATTTAAAAAAGGAGCCTGAAGTGCAAGAC---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
>Pbra_NSP_2_F
-------------------------------------------------------ACGAAAAGTCATGGCAAGTCA-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
>sgRNA_2
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------CTTCTTAGCCCTCGCGGCTTTGG-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
>Pbra_NSP_2_R_rc
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------GGACATTGCACAACCTCGTT-----------------------------------------------------------------------------------------------------------------------------------------------------

# the first sequence is your DNA for the PCR product, trim that out using nano
nano NSP_region_PCR_sgRNA_genomicDNA.fasta
# use ctrl-k to cut each line that is not the first fasta sequence
# then use ctrl-X to exit but be sure to save as new name, like NSP_genomic_ref.fasta

# check you did this right using head
head NSP_genomic_ref.fasta
# should look like this
head NSP_genomic_ref.fasta
>NC_059669.1:14882048-14885601 Pieris brassicae chromosome 5, ilPieBrab1.1, whole genome shotgun sequence
GCGATAAAATAAAAACTTCAAGAAGATAAGGTAGTTAAGATGACTTTTAATAAATACGAAAAGTCATGGCAAGTCATAGAAAGATCGCGAAAAATACTAATTAATGATTTTGAAAATGATAGGATCTGATTGTTTCCTTGATAACATTTGAATATATAAACTCGACACCTGTGAAATAAATCAATTAACACTAATAAAATGAAAGGTGTTGTAGTCTTCTTAGCCCTCGCGGCTTTGGGGAGCGCTAAGCCTCGTCTGTTCGAGACGTTCCAAGACCACTTTCAACACTTTTTGGACATAAGCAATGCCTTGGAGGGTGCCCATTGGAGACGACAACAGGGTCAGGGGTACACTCCTAACCCAGAATACATCGAAATGTTGAACAAGCTGAGCGAGCAAAACTTGAAACAGATGCTCGCTGATTTAAAAAAGGAGCCTGAAGTGCAAGACGTGAGTACCTTATACATTTATATACTAGCCTCAAAATTGTTTGAAATAAATATTTTTACAAAGAATAACTGATTCGATTTGGACATTGCACAACCTCGTTCATAAAGGAGACTGTAGAATCACGGAATATGTTAATAGTGAGTCTTGTGTATAAAAAGCAACTGAAACTTACTTCAACCATAACGCGATTGGCTCGATGTGTGTGGAAGGCAAATCACAAATAAAATTCAAGTCAAATTTACAAAATAT

# OK, so now you want to run fastqc on these.

/mnt/griffin/chrwhe/software/minimap2/minimap2 
/mnt/griffin/chrwhe/software/fastqc barcode01/*.fastq.gz -o . --threads 2