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
for x in {1..2}; do
    find . -name "*barcode$x*.fastq.gz" | grep 'pass' | grep 'barcode' 
    echo $x
done

# combine for set of 24 barcodes
for x in {1..24}; do
    find . -name "*barcode$x*.fastq.gz" | grep 'pass' | grep 'barcode' | xargs cat > "barcode${x}.combined.fastq.gz"
done


# find . -name "*_0.fastq.gz" | grep barcode | cut -f2 -d '/' | grep -oP 'barcode\d+'


# find . -name "*_0.fastq.gz" | grep barcode| while read f; do
#     cp "$f" fastq_files/$(echo "$f" | cut -f2 -d '/' | grep -oP 'barcode\d+').run1.fastq.gz
# done

# now I have a folder of only the fastq files
ls fastq_files/
# barcode01.run1.fastq.gz  barcode05.run1.fastq.gz  barcode09.run1.fastq.gz  barcode13.run1.fastq.gz  barcode17.run1.fastq.gz  barcode21.run1.fastq.gz
# barcode02.run1.fastq.gz  barcode06.run1.fastq.gz  barcode10.run1.fastq.gz  barcode14.run1.fastq.gz  barcode18.run1.fastq.gz  barcode22.run1.fastq.gz
# barcode03.run1.fastq.gz  barcode07.run1.fastq.gz  barcode11.run1.fastq.gz  barcode15.run1.fastq.gz  barcode19.run1.fastq.gz  barcode23.run1.fastq.gz
# barcode04.run1.fastq.gz  barcode08.run1.fastq.gz  barcode12.run1.fastq.gz  barcode16.run1.fastq.gz  barcode20.run1.fastq.gz  barcode24.run1.fastq.gz

mv fastq_files/ run1_fastq_files

######
cd /mnt/griffin/chrwhe/ONT_testing/run2_fastq_files

# need to just double check what the barcodes were
# 25-74?

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



