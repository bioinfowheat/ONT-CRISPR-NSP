# data from the run is located at 

# graphical overview of what's in the data folder

tree run1_fastq_pass | head 
run1_fastq_pass
├── barcode01
│   ├── FBF81064_pass_barcode01_b0e09933_66cabb9a_0.fastq.gz
│   └── FBF81064_pass_barcode01_b0e09933_66cabb9a_1.fastq.gz
├── barcode02
│   ├── FBF81064_pass_barcode02_b0e09933_66cabb9a_0.fastq.gz
│   └── FBF81064_pass_barcode02_b0e09933_66cabb9a_1.fastq.gz
├── barcode03
│   ├── FBF81064_pass_barcode03_b0e09933_66cabb9a_0.fastq.gz
│   └── FBF81064_pass_barcode03_b0e09933_66cabb9a_1.fastq.gz

# in /barcode01

# assess file sizes
ls -lh
total 5.5M
-rwxrwxrwx 1 chrwhe chrwhe 5.3M Mar  5 17:14 FBF81064_pass_barcode01_b0e09933_66cabb9a_0.fastq.gz
-rwxrwxrwx 1 chrwhe chrwhe 235K Mar  5 17:16 FBF81064_pass_barcode01_b0e09933_66cabb9a_1.fastq.gz

# OK, so we can see that *_0.fastq.gz is the larger file, this is the data we want

# have a look at the file
# the file is compressed (ends in *.gz), so we can only look at it if we uncompress it

# here I use command cat, but for compressed files, so zcat, and then only look at the first 10 lines using "head"
zcat barcode01/FBF81064_pass_barcode01_b0e09933_66cabb9a_0.fastq.gz | head 
@04f28d41-b116-4dc9-add4-401430b984e8 runid=b0e09933-dbfa-44e0-900c-21cc9e7e4d18 ch=290 start_time=2026-03-05T16:16:37.520170+01:00 flow_cell_id=FBF81064 protocol_group_id=NSP_500bp_trial sample_id=NSP_Pnapi_500bp barcode=barcode01 barcode_alias=barcode01 parent_read_id=04f28d41-b116-4dc9-add4-401430b984e8 basecall_model_version_id=dna_r10.4.1_e8.2_400bps_hac@v5.2.0
ATGTCCTGTTCTTCGTTCGGTTATGCAAGCCGATATTAACAAAAGTTGTCGGTGTCTTTGTGGTTTTCGCATTTATCGTGAAACGCTTTCGCGTTTTTAGTCGCTTCAATAGATCAATTAACACTAATAAAATGAAAGGTGTTGTAGTCTTCTAGCCCTCGCGGCTTTGGGGAGCGCTAAGCCTCGTCTGTTCGAGACGTTCCAAGACCACTTTCAACACTTTTTGGACATAAGCGATGC
+
"%')**-,+,)))()))*%%%+)*&''&$'('&%%%'%'(''.889:9<@@@@MQGGGGMQQQRQSSSLKKLPRIG7667EORPHHGGOHED@;<:8?'&&&&)*/++//0..00344<99>1//0FHCDAJKJJLMRPMLNMJK333-+**,&&9=?GCEHMOOPQO??@RQA?>?C:?7DFF><<<GIIMG@>>?FBDC:A=??B=<730/76789ADCBIJNKKIHFFBBBC76668
@35d39147-1ff2-4425-b114-9b51488942e8 runid=b0e09933-dbfa-44e0-900c-21cc9e7e4d18 ch=235 start_time=2026-03-05T16:16:41.520170+01:00 flow_cell_id=FBF81064 protocol_group_id=NSP_500bp_trial sample_id=NSP_Pnapi_500bp barcode=barcode01 barcode_alias=barcode01 parent_read_id=35d39147-1ff2-4425-b114-9b51488942e8 basecall_model_version_id=dna_r10.4.1_e8.2_400bps_hac@v5.2.0
ATGTTTCCTGTACTTGGTTGGTTGTGTTTTTCCCGATATTAACCAGAAAGTTGTCGGTGTCTTTGTGGTTTTCGCATTTATCGTGAAACGCTTTCGCGTTTTTCGTGCGCCGCTTCAACGGATTCCATTTGGACATTGCACAACCTCGTTCATAAAGGAGACTGTAGAATCACGGAATATGTTAATAGTGAGTCTTGTGTATAAAAAGCAACTGAAACTTACTTCAACCATGG
+
"#+*)&&')*,,+-.&''*(()***('%#""""%&&&&''%&''+,)*.,*)(+==>?FIIKMLIJGHFJMPMDCCDHJFFDCDDFGJKHHHIQQJHFFHHJQG>>>C>=><<:/+,77<<9943::FFFFJKJIIJJMLKKLNMM=7:<1CC?>DCE<@=::<>3*).)*DGHGHJKHIIJLKONNMMMMMOMSROJECGHKKMSSSQA@@AE>?D9999CC?<:999:9*(
@4223d830-7439-406c-a012-10484f177d02 runid=b0e09933-dbfa-44e0-900c-21cc9e7e4d18 ch=13 start_time=2026-03-05T16:16:41.520170+01:00 flow_cell_id=FBF81064 protocol_group_id=NSP_500bp_trial sample_id=NSP_Pnapi_500bp barcode=barcode01 barcode_alias=barcode01 parent_read_id=4223d830-7439-406c-a012-10484f177d02 basecall_model_version_id=dna_r10.4.1_e8.2_400bps_hac@v5.2.0
TGTTTTTGTCCTCTACTGGTTCAGTTATCAAGCCGATATTAACCACAAAAAAAGTTGTCGGTGTCTTTGTGGTTTTCGCATTTATCGTGAAACGCTTTCGCGTTTTTCGTGCGCCGCTTCACTCGTTCATAAAGGAGACTGTAGAATCACGGAATATGTTAATAGTGAGTCTTGTGTATAAAAAGCAACTGAAACTTACTTCAACCATAA

# ')"
# fastq is a 4 line file for each sequence
# line 1: each header starts on @
# line 2: base pair calls
# line 3: is space "+"
# line 4: is quality encoding on PHRED33 scale 


# make a soft link of all the fastq data to your local folder
find . -name "*_0.fastq.gz" | grep barcode
./barcode17/FBF81064_pass_barcode17_b0e09933_66cabb9a_0.fastq.gz
./barcode10/FBF81064_pass_barcode10_b0e09933_66cabb9a_0.fastq.gz
./barcode19/FBF81064_pass_barcode19_b0e09933_66cabb9a_0.fastq.gz
./barcode21/FBF81064_pass_barcode21_b0e09933_66cabb9a_0.fastq.gz
./barcode20/FBF81064_pass_barcode20_b0e09933_66cabb9a_0.fastq.gz
./barcode18/FBF81064_pass_barcode18_b0e09933_66cabb9a_0.fastq.gz
./barcode11/FBF81064_pass_barcode11_b0e09933_66cabb9a_0.fastq.gz
./barcode16/FBF81064_pass_barcode16_b0e09933_66cabb9a_0.fastq.gz
./barcode05/FBF81064_pass_barcode05_b0e09933_66cabb9a_0.fastq.gz
./barcode02/FBF81064_pass_barcode02_b0e09933_66cabb9a_0.fastq.gz
./barcode03/FBF81064_pass_barcode03_b0e09933_66cabb9a_0.fastq.gz
./barcode04/FBF81064_pass_barcode04_b0e09933_66cabb9a_0.fastq.gz
./barcode13/FBF81064_pass_barcode13_b0e09933_66cabb9a_0.fastq.gz
./barcode14/FBF81064_pass_barcode14_b0e09933_66cabb9a_0.fastq.gz
./barcode22/FBF81064_pass_barcode22_b0e09933_66cabb9a_0.fastq.gz
./barcode24/FBF81064_pass_barcode24_b0e09933_66cabb9a_0.fastq.gz
./barcode23/FBF81064_pass_barcode23_b0e09933_66cabb9a_0.fastq.gz
./barcode15/FBF81064_pass_barcode15_b0e09933_66cabb9a_0.fastq.gz
./barcode12/FBF81064_pass_barcode12_b0e09933_66cabb9a_0.fastq.gz
./barcode08/FBF81064_pass_barcode08_b0e09933_66cabb9a_0.fastq.gz
./barcode01/FBF81064_pass_barcode01_b0e09933_66cabb9a_0.fastq.gz
./barcode06/FBF81064_pass_barcode06_b0e09933_66cabb9a_0.fastq.gz
./barcode07/FBF81064_pass_barcode07_b0e09933_66cabb9a_0.fastq.gz
./barcode09/FBF81064_pass_barcode09_b0e09933_66cabb9a_0.fastq.gz

find . -name "*_0.fastq.gz" | grep barcode | cut -f2 -d '/' | grep -oP 'barcode\d+'


find . -name "*_0.fastq.gz" | grep barcode| while read f; do
    cp "$f" fastq_files/$(echo "$f" | cut -f2 -d '/' | grep -oP 'barcode\d+').run1.fastq.gz
done

# now I have a folder of only the fastq files
ls fastq_files/
barcode01.run1.fastq.gz  barcode05.run1.fastq.gz  barcode09.run1.fastq.gz  barcode13.run1.fastq.gz  barcode17.run1.fastq.gz  barcode21.run1.fastq.gz
barcode02.run1.fastq.gz  barcode06.run1.fastq.gz  barcode10.run1.fastq.gz  barcode14.run1.fastq.gz  barcode18.run1.fastq.gz  barcode22.run1.fastq.gz
barcode03.run1.fastq.gz  barcode07.run1.fastq.gz  barcode11.run1.fastq.gz  barcode15.run1.fastq.gz  barcode19.run1.fastq.gz  barcode23.run1.fastq.gz
barcode04.run1.fastq.gz  barcode08.run1.fastq.gz  barcode12.run1.fastq.gz  barcode16.run1.fastq.gz  barcode20.run1.fastq.gz  barcode24.run1.fastq.gz

mv fastq_files/ run1_fastq_files

cd 4interns
cp -r run1_fastq_files/ ../4interns/

# make this generally accessible to them.
sudo cp -r 4interns /mnt/griffin/
sudo chown :general -R /mnt/griffin/4interns
sudo chmod 550 -R /mnt/griffin/4interns

