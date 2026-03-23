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

# OK, so we can see that *_0.fastq.gz is the larger file, but we want both files, as they are 
# reads from the same barcode, just saved in different files (the program saves reads incrementally)

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
find . -name "*.fastq.gz" | grep 'pass' | grep 'barcode' 
...
./barcode15/FBF81064_pass_barcode15_b0e09933_66cabb9a_1.fastq.gz
./barcode15/FBF81064_pass_barcode15_b0e09933_66cabb9a_0.fastq.gz
./barcode12/FBF81064_pass_barcode12_b0e09933_66cabb9a_1.fastq.gz
./barcode12/FBF81064_pass_barcode12_b0e09933_66cabb9a_0.fastq.gz
./barcode08/FBF81064_pass_barcode08_b0e09933_66cabb9a_0.fastq.gz
./barcode08/FBF81064_pass_barcode08_b0e09933_66cabb9a_1.fastq.gz
./barcode01/FBF81064_pass_barcode01_b0e09933_66cabb9a_0.fastq.gz
./barcode01/FBF81064_pass_barcode01_b0e09933_66cabb9a_1.fastq.gz
./barcode06/FBF81064_pass_barcode06_b0e09933_66cabb9a_0.fastq.gz
./barcode06/FBF81064_pass_barcode06_b0e09933_66cabb9a_1.fastq.gz
./barcode07/FBF81064_pass_barcode07_b0e09933_66cabb9a_0.fastq.gz
./barcode07/FBF81064_pass_barcode07_b0e09933_66cabb9a_1.fastq.gz
./barcode09/FBF81064_pass_barcode09_b0e09933_66cabb9a_0.fastq.gz
./barcode09/FBF81064_pass_barcode09_b0e09933_66cabb9a_1.fastq.gz

# need to combine there
# cat file1.gz file2.gz > combined.gz
# gz files are designed to be combined without decompression

# test
cat ./barcode09/FBF81064_pass_barcode09_b0e09933_66cabb9a_0.fastq.gz ./barcode09/FBF81064_pass_barcode09_b0e09933_66cabb9a_1.fastq.gz | test.gz

ls -lh test.gz 
-rw-r--r-- 1 chrwhe chrwhe 11M Mar 17 07:02 test.gz
ls -lh ./barcode09/FBF81064_pass_barcode09_b0e09933_66cabb9a*gz
-rwxrwxrwx 1 chrwhe chrwhe  11M Mar  5 17:14 ./barcode09/FBF81064_pass_barcode09_b0e09933_66cabb9a_0.fastq.gz
-rwxrwxrwx 1 chrwhe chrwhe 451K Mar  5 17:16 ./barcode09/FBF81064_pass_barcode09_b0e09933_66cabb9a_1.fastq.gz

zcat test.gz | tail -n 4 | head -1
@7448a1f2-49b8-4dda-983d-57d851f3d9d5 runid=b0e09933-dbfa-44e0-900c-21cc9e7e4d18 ch=68 start_time=2026-03-05T17:16:24.520170+01:00 flow_cell_id=FBF81064 protocol_group_id=NSP_500bp_trial sample_id=NSP_Pnapi_500bp barcode=barcode09 barcode_alias=barcode09 parent_read_id=7448a1f2-49b8-4dda-983d-57d851f3d9d5 basecall_model_version_id=dna_r10.4.1_e8.2_400bps_hac@v5.2.0

zcat ./barcode09/FBF81064_pass_barcode09_b0e09933_66cabb9a_1.fastq.gz | tail -n 4 | head -1  
@7448a1f2-49b8-4dda-983d-57d851f3d9d5 runid=b0e09933-dbfa-44e0-900c-21cc9e7e4d18 ch=68 start_time=2026-03-05T17:16:24.520170+01:00 flow_cell_id=FBF81064 protocol_group_id=NSP_500bp_trial sample_id=NSP_Pnapi_500bp barcode=barcode09 barcode_alias=barcode09 parent_read_id=7448a1f2-49b8-4dda-983d-57d851f3d9d5 basecall_model_version_id=dna_r10.4.1_e8.2_400bps_hac@v5.2.0

# OK, these are identical meaning that the cat of the two gz files works.

# great, so now need to write script that will cycle through set of barcodes, combine within barcode
# and save as simplified name

# test
for x in {01..02}; do
    find . -name "*barcode$x*.fastq.gz" | grep 'pass' | grep 'barcode' 
    echo $x
done
# ./barcode01/FBF81064_pass_barcode01_b0e09933_66cabb9a_0.fastq.gz
# ./barcode01/FBF81064_pass_barcode01_b0e09933_66cabb9a_1.fastq.gz
# 01
# ./barcode02/FBF81064_pass_barcode02_b0e09933_66cabb9a_0.fastq.gz
# ./barcode02/FBF81064_pass_barcode02_b0e09933_66cabb9a_1.fastq.gz
# 02

# test this to spit out 01 to 24, which it does!!!
for x in {01..24}; do
    echo $x
done


# combine for set of 24 barcodes
mkdir combined_fastq_files
for x in {01..24}; do
    find . -name "*barcode$x*.fastq.gz" | grep 'pass' | grep 'barcode' | xargs cat > combined_fastq_files/"barcode${x}.combined.fastq.gz"
done

find . -name "*barcode24*.fastq.gz" | grep 'pass' | grep 'barcode' | tail 


# assess, looks like it got things right!
zcat combined_fastq_files/barcode09.combined.fastq.gz | tail -n 4 | head -1
@7448a1f2-49b8-4dda-983d-57d851f3d9d5 runid=b0e09933-dbfa-44e0-900c-21cc9e7e4d18 ch=68 start_time=2026-03-05T17:16:24.520170+01:00 flow_cell_id=FBF81064 protocol_group_id=NSP_500bp_trial sample_id=NSP_Pnapi_500bp barcode=barcode09 barcode_alias=barcode09 parent_read_id=7448a1f2-49b8-4dda-983d-57d851f3d9d5 basecall_model_version_id=dna_r10.4.1_e8.2_400bps_hac@v5.2.0


# now I have a folder of only the fastq files
ls /mnt/griffin/chrwhe/ONTdata/run1_fastq_pass/combined_fastq_files/
# barcode01.combined.fastq.gz  barcode06.combined.fastq.gz  barcode11.combined.fastq.gz  barcode16.combined.fastq.gz  barcode21.combined.fastq.gz
# barcode02.combined.fastq.gz  barcode07.combined.fastq.gz  barcode12.combined.fastq.gz  barcode17.combined.fastq.gz  barcode22.combined.fastq.gz
# barcode03.combined.fastq.gz  barcode08.combined.fastq.gz  barcode13.combined.fastq.gz  barcode18.combined.fastq.gz  barcode23.combined.fastq.gz
# barcode04.combined.fastq.gz  barcode09.combined.fastq.gz  barcode14.combined.fastq.gz  barcode19.combined.fastq.gz  barcode24.combined.fastq.gz
# barcode05.combined.fastq.gz  barcode10.combined.fastq.gz  barcode15.combined.fastq.gz  barcode20.combined.fastq.gz


######
cd /mnt/griffin/chrwhe/ONT_testing/run2_fastq_files

# need to just double check what the barcodes were
# 25-75, based upon report

# can check by counting the number of files per barcode, as there should be many for ones that we used

# lots of reads per barcode
barcode40$ ls
FBF81064_pass_barcode40_e7907e49_7be15ff9_0.fastq.gz   FBF81064_pass_barcode40_e7907e49_7be15ff9_19.fastq.gz
FBF81064_pass_barcode40_e7907e49_7be15ff9_10.fastq.gz  FBF81064_pass_barcode40_e7907e49_7be15ff9_1.fastq.gz
FBF81064_pass_barcode40_e7907e49_7be15ff9_11.fastq.gz  FBF81064_pass_barcode40_e7907e49_7be15ff9_2.fastq.gz
FBF81064_pass_barcode40_e7907e49_7be15ff9_12.fastq.gz  FBF81064_pass_barcode40_e7907e49_7be15ff9_3.fastq.gz
FBF81064_pass_barcode40_e7907e49_7be15ff9_13.fastq.gz  FBF81064_pass_barcode40_e7907e49_7be15ff9_4.fastq.gz
FBF81064_pass_barcode40_e7907e49_7be15ff9_14.fastq.gz  FBF81064_pass_barcode40_e7907e49_7be15ff9_5.fastq.gz
FBF81064_pass_barcode40_e7907e49_7be15ff9_15.fastq.gz  FBF81064_pass_barcode40_e7907e49_7be15ff9_6.fastq.gz
FBF81064_pass_barcode40_e7907e49_7be15ff9_16.fastq.gz  FBF81064_pass_barcode40_e7907e49_7be15ff9_7.fastq.gz
FBF81064_pass_barcode40_e7907e49_7be15ff9_17.fastq.gz  FBF81064_pass_barcode40_e7907e49_7be15ff9_8.fastq.gz
FBF81064_pass_barcode40_e7907e49_7be15ff9_18.fastq.gz  FBF81064_pass_barcode40_e7907e49_7be15ff9_9.fastq.gz

# so make a bash one line script for this, here I break that down for you 

# list all fastq.gz files in this folder (and subfolders)
find . -name "*.fastq.gz" | \
# grap all with pass in name
grep 'pass' | \
# grab all with barcode in name
grep 'barcode' | \
# grab the text between / of the path
cut -f 2 -d '/' | \
# sort these
sort | \
# count the unique values of each
uniq -c


# combining this set of the 2nd run of the 1st flowcell of NSP amplicons
mkdir combined_fastq_files
for x in {25..75}; do
    find . -name "*barcode$x*.fastq.gz" | grep -v "/\._" | grep 'pass' | grep 'barcode' | xargs cat > combined_fastq_files/"barcode${x}.combined.fastq.gz"
done

find . -name "*barcode75*.fastq.gz" | grep -v "/\._" | grep 'pass' | grep 'barcode'  

zcat /mnt/griffin/chrwhe/ONT_testing/run2_fastq_files/combined_fastq_files/barcode75.combined.fastq.gz | tail -n 4 | head -1
@3537691d-44c6-4177-ae56-470f7c903aed runid=e7907e49-186a-4386-85ad-35274b0c2ea6 ch=412 start_time=2026-03-14T04:14:40.712138+01:00 flow_cell_id=FBF81064 protocol_group_id=NSP_480bp_part2 sample_id= barcode=barcode75 barcode_alias=barcode75 parent_read_id=3537691d-44c6-4177-ae56-470f7c903aed basecall_model_version_id=dna_r10.4.1_e8.2_400bps_hac@v5.2.0



for f in *.fastq.gz; do echo "$f: $(zcat "$f" | wc -l | awk '{print $1/4}')"; done 
...
barcode71.combined.fastq.gz: 73087
barcode72.combined.fastq.gz: 84843
barcode73.combined.fastq.gz: 106010
barcode74.combined.fastq.gz: 43066
barcode75.combined.fastq.gz: 74159

# start is the same
find . -name "*barcode75*.fastq.gz" | grep -v "/\._" | grep 'pass' | grep 'barcode' | xargs zcat | head -1
@c409e041-fd4a-475b-bbbf-7ad7a5f0f26d runid=e7907e49-186a-4386-85ad-35274b0c2ea6 ch=313 start_time=2026-03-13T19:14:48.712138+01:00 flow_cell_id=FBF81064 protocol_group_id=NSP_480bp_part2 sample_id= barcode=barcode75 barcode_alias=barcode75 parent_read_id=c409e041-fd4a-475b-bbbf-7ad7a5f0f26d basecall_model_version_id=dna_r10.4.1_e8.2_400bps_hac@v5.2.0
zcat combined_fastq_files/barcode75.combined.fastq.gz | head -1
@c409e041-fd4a-475b-bbbf-7ad7a5f0f26d runid=e7907e49-186a-4386-85ad-35274b0c2ea6 ch=313 start_time=2026-03-13T19:14:48.712138+01:00 flow_cell_id=FBF81064 protocol_group_id=NSP_480bp_part2 sample_id= barcode=barcode75 barcode_alias=barcode75 parent_read_id=c409e041-fd4a-475b-bbbf-7ad7a5f0f26d basecall_model_version_id=dna_r10.4.1_e8.2_400bps_hac@v5.2.0

# last sequence
find . -name "*barcode75*.fastq.gz" | grep -v "/\._" | grep 'pass' | grep 'barcode' | xargs zcat | tail -n 4 | head -1
@2315dc36-a0cc-4947-bf1c-6d525bdecc93 runid=e7907e49-186a-4386-85ad-35274b0c2ea6 ch=166 start_time=2026-03-13T19:14:42.712138+01:00 flow_cell_id=FBF81064 protocol_group_id=NSP_480bp_part2 sample_id= barcode=barcode75 barcode_alias=barcode75 parent_read_id=2315dc36-a0cc-4947-bf1c-6d525bdecc93 basecall_model_version_id=dna_r10.4.1_e8.2_400bps_hac@v5.2.0
zcat combined_fastq_files/barcode75.combined.fastq.gz | tail -n 4 | head -1
@2315dc36-a0cc-4947-bf1c-6d525bdecc93 runid=e7907e49-186a-4386-85ad-35274b0c2ea6 ch=166 start_time=2026-03-13T19:14:42.712138+01:00 flow_cell_id=FBF81064 protocol_group_id=NSP_480bp_part2 sample_id= barcode=barcode75 barcode_alias=barcode75 parent_read_id=2315dc36-a0cc-4947-bf1c-6d525bdecc93 basecall_model_version_id=dna_r10.4.1_e8.2_400bps_hac@v5.2.0

# and last file in the 
find . -name "*barcode75*.fastq.gz" | grep -v "/\._" | grep 'pass' | grep 'barcode' | tail -1
# /fastq_pass/barcode75/FBF81064_pass_barcode75_e7907e49_7be15ff9_2.fastq.gz

zcat fastq_pass/barcode75/FBF81064_pass_barcode75_e7907e49_7be15ff9_2.fastq.gz | tail -n 4 | head -1
@2315dc36-a0cc-4947-bf1c-6d525bdecc93 runid=e7907e49-186a-4386-85ad-35274b0c2ea6 ch=166 start_time=2026-03-13T19:14:42.712138+01:00 flow_cell_id=FBF81064 protocol_group_id=NSP_480bp_part2 sample_id= barcode=barcode75 barcode_alias=barcode75 parent_read_id=2315dc36-a0cc-4947-bf1c-6d525bdecc93 basecall_model_version_id=dna_r10.4.1_e8.2_400bps_hac@v5.2.0

