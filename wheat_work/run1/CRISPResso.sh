# https://github.com/pinellolab/CRISPResso2?tab=readme-ov-file

# manual


# install 
micromamba create -n crispresso2_env -c conda-forge -c bioconda crispresso2
# activate
micromamba activate crispresso2_env

CRISPRessoBatch -h
usage: CRISPRessoBatch [-h] [--version] [-a AMPLICON_SEQ] [-an AMPLICON_NAME] [-amas AMPLICON_MIN_ALIGNMENT_SCORE]
                       [--default_min_aln_score DEFAULT_MIN_ALN_SCORE] [--expand_ambiguous_alignments] [--assign_ambiguous_alignments_to_first_reference]
                       [-g GUIDE_SEQ] [-gn GUIDE_NAME] [-fg FLEXIGUIDE_SEQ] [-fh FLEXIGUIDE_HOMOLOGY] [-fgn FLEXIGUIDE_NAME]
                       [--flexiguide_gap_open_penalty FLEXIGUIDE_GAP_OPEN_PENALTY] [--flexiguide_gap_extend_penalty FLEXIGUIDE_GAP_EXTEND_PENALTY]
                       [--discard_guide_positions_overhanging_amplicon_edge] [-e EXPECTED_HDR_AMPLICON_SEQ] [-c CODING_SEQ] [--config_file CONFIG_FILE]
                       [-q MIN_AVERAGE_READ_QUALITY] [-s MIN_SINGLE_BP_QUALITY] [--min_bp_quality_or_N MIN_BP_QUALITY_OR_N] [--file_prefix FILE_PREFIX]
                       [-n NAME] [--display_name DISPLAY_NAME] [--suppress_amplicon_name_truncation] [-o OUTPUT_FOLDER] [-v VERBOSITY]
                       [--split_interleaved_input] [--trim_sequences] [--trimmomatic_command TRIMMOMATIC_COMMAND]
                       [--trimmomatic_options_string TRIMMOMATIC_OPTIONS_STRING] [--flash_command FLASH_COMMAND] [--fastp_command FASTP_COMMAND]
                       [--fastp_options_string FASTP_OPTIONS_STRING] [--min_paired_end_reads_overlap MIN_PAIRED_END_READS_OVERLAP]
                       [--max_paired_end_reads_overlap MAX_PAIRED_END_READS_OVERLAP] [--stringent_flash_merging] [-w QUANTIFICATION_WINDOW_SIZE]
                       [-wc QUANTIFICATION_WINDOW_CENTER] [--exclude_bp_from_left EXCLUDE_BP_FROM_LEFT] [--exclude_bp_from_right EXCLUDE_BP_FROM_RIGHT]
                       [--use_legacy_insertion_quantification] [--ignore_substitutions] [--ignore_insertions] [--ignore_deletions] [--discard_indel_reads]
                       [--needleman_wunsch_gap_open NEEDLEMAN_WUNSCH_GAP_OPEN] [--needleman_wunsch_gap_extend NEEDLEMAN_WUNSCH_GAP_EXTEND]
                       [--needleman_wunsch_gap_incentive NEEDLEMAN_WUNSCH_GAP_INCENTIVE]
                       [--needleman_wunsch_aln_matrix_loc NEEDLEMAN_WUNSCH_ALN_MATRIX_LOC] [--plot_histogram_outliers]
                       [--plot_window_size PLOT_WINDOW_SIZE] [--min_frequency_alleles_around_cut_to_plot MIN_FREQUENCY_ALLELES_AROUND_CUT_TO_PLOT]
                       [--expand_allele_plots_by_quantification] [--allele_plot_pcts_only_for_assigned_reference] [-qwc QUANTIFICATION_WINDOW_COORDINATES]
                       [--annotate_wildtype_allele ANNOTATE_WILDTYPE_ALLELE] [--keep_intermediate] [--dump] [--write_detailed_allele_table]
                       [--fastq_output] [--bam_output] [-x BOWTIE2_INDEX] [--zip_output]
                       [--max_rows_alleles_around_cut_to_plot MAX_ROWS_ALLELES_AROUND_CUT_TO_PLOT] [--suppress_report] [--place_report_in_output_folder]
                       [--suppress_plots] [--base_editor_output] [--conversion_nuc_from CONVERSION_NUC_FROM] [--conversion_nuc_to CONVERSION_NUC_TO]
                       [--prime_editing_pegRNA_spacer_seq PRIME_EDITING_PEGRNA_SPACER_SEQ]
                       [--prime_editing_pegRNA_extension_seq PRIME_EDITING_PEGRNA_EXTENSION_SEQ]
                       [--prime_editing_pegRNA_extension_quantification_window_size PRIME_EDITING_PEGRNA_EXTENSION_QUANTIFICATION_WINDOW_SIZE]
                       [--prime_editing_pegRNA_scaffold_seq PRIME_EDITING_PEGRNA_SCAFFOLD_SEQ]
                       [--prime_editing_pegRNA_scaffold_min_match_length PRIME_EDITING_PEGRNA_SCAFFOLD_MIN_MATCH_LENGTH]
                       [--prime_editing_nicking_guide_seq PRIME_EDITING_NICKING_GUIDE_SEQ]
                       [--prime_editing_override_prime_edited_ref_seq PRIME_EDITING_OVERRIDE_PRIME_EDITED_REF_SEQ]
                       [--prime_editing_override_sequence_checks] [--crispresso1_mode] [--dsODN DSODN] [--auto] [--debug] [--no_rerun] [-p N_PROCESSES]
                       [--bam_input BAM_INPUT] [--bam_chr_loc BAM_CHR_LOC] -bs BATCH_SETTINGS [--skip_failed]
                       [--min_reads_for_inclusi
                       [--crispresso_command CRISPRESSO_COMMAND] [--disable_guardrails] [--use_matplotlib] [--halt_on_plot_fail]



#####
CRISPRessoBatch Parameters

# sgRNA
CTTCTTAGCCCTCGCGGCTTTGG
# amplicion
ACGAAAAGTCATGGCAAGTCATAGAAAGATCGCGAAAAATACTAATTAATGATTTTGAAAATGATAGGATCTGATTGTTTCCTTGATAACATTTGAATATATAAACTCGACACCTGTGAAATAAATCAATTAACACTAATAAAATGAAAGGTGTTGTAGTCTTCTTAGCCCTCGCGGCTTTGGGGAGCGCTAAGCCTCGTCTGTTCGAGACGTTCCAAGACCACTTTCAACACTTTTTGGACATAAGCAATGCCTTGGAGGGTGCCCATTGGAGACGACAACAGGGTCAGGGGTACACTCCTAACCCAGAATACATCGAAATGTTGAACAAGCTGAGCGAGCAAAACTTGAAACAGATGCTCGCTGATTTAAAAAAGGAGCCTGAAGTGCAAGACGTGAGTACCTTATACATTTATATACTAGCCTCAAAATTGTTTGAAATAAATATTTTTACAAAGAATAACTGATTCGATTTGGACATTGCACAACCTCGTT

###
Batch Files are .tsv (Tab Separated Values) files that allow you to upload multiple samples at once. They allow you to customize the way that your files are run, and must be used when doing paired-end reads in batch mode.
Batch files allow you to customize multiple sample's amplicon, sgRNA, and much more to be processed during a single run.
#
name	fastq_r1	fastq_r2	amplicon_seq	guide_seq
Sample 1	ReplaceMeWithR1Filename	[If Performing Paired End Reads Analysis]ReplaceMeWithR2Filename	OptionalReplaceMeWithAmplicon	OptionalReplaceMeWithsgRNA
Sample 2	ReplaceMeWithR1Filename	[If Performing Paired End Reads Analysis]ReplaceMeWithR2Filename	OptionalReplaceMeWithAmplicon	OptionalReplaceMeWithsgRNA
Sample 3	ReplaceMeWithR1Filename	[If Performing Paired End Reads Analysis]ReplaceMeWithR2Filename	OptionalReplaceMeWithAmplicon	OptionalReplaceMeWithsgRNA

# example run 
CRISPRessoBatch --batch_settings batch.batch --amplicon_seq CATTGCAGAGAGGCGTATCATTTCGCGGATGTTCCAATCAGTACGCAGAGAGTCGCCGTCTCCAAGGTGAAAGCGGAAGTAGGGCCTTCGCGCACCTCATGGAATCCCTTCTGCAGCACCTGGATCGCTTTTCCGAGCTTCTGGCGGTCTCAAGCACTACCTACGTCAGCACCTGGGACCCC \
-p 4 --base_editor_output -g GGAATCCCTTCTGCAGCACC -wc -10 -w 20
#
[-w QUANTIFICATION_WINDOW_SIZE]
[-wc QUANTIFICATION_WINDOW_CENTER]
[-a AMPLICON_SEQ] 
[-an AMPLICON_NAME]
[-p N_PROCESSES]
[--fastp_options_string FASTP_OPTIONS_STRING] 


# for NSP
CRISPRessoBatch --batch_settings NSPbatch.batch --amplicon_seq ACGAAAAGTCATGGCAAGTCATAGAAAGATCGCGAAAAATACTAATTAATGATTTTGAAAATGATAGGATCTGATTGTTTCCTTGATAACATTTGAATATATAAACTCGACACCTGTGAAATAAATCAATTAACACTAATAAAATGAAAGGTGTTGTAGTCTTCTTAGCCCTCGCGGCTTTGGGGAGCGCTAAGCCTCGTCTGTTCGAGACGTTCCAAGACCACTTTCAACACTTTTTGGACATAAGCAATGCCTTGGAGGGTGCCCATTGGAGACGACAACAGGGTCAGGGGTACACTCCTAACCCAGAATACATCGAAATGTTGAACAAGCTGAGCGAGCAAAACTTGAAACAGATGCTCGCTGATTTAAAAAAGGAGCCTGAAGTGCAAGACGTGAGTACCTTATACATTTATATACTAGCCTCAAAATTGTTTGAAATAAATATTTTTACAAAGAATAACTGATTCGATTTGGACATTGCACAACCTCGTT \
-p 4 --base_editor_output -g CTTCTTAGCCCTCGCGGCTTTGG -wc -3 -w 50 

cd /mnt/griffin/chrwhe/ONT_testing
mkdir espresso_testing
cd espresso_testing
cp ../run1_fastq_files/barcode0*.gz .
parallel 'unpigz {}' ::: *.gz 
ls bar* | cut -f1 -d . > barcodes
head barcodes
barcode01
# barcode02
# barcode03
# barcode04
# barcode05
# barcode06
# barcode07
# barcode08
# barcode09

for x in {01..09}; do
    echo "barcode$x" "barcode$x.run1.fastq" ""
done | tr " " "\t"
#
barcode01       barcode01.run1.fastq
barcode02       barcode02.run1.fastq
barcode03       barcode03.run1.fastq
barcode04       barcode04.run1.fastq
barcode05       barcode05.run1.fastq
barcode06       barcode06.run1.fastq
barcode07       barcode07.run1.fastq
barcode08       barcode08.run1.fastq
barcode09       barcode09.run1.fastq

# save to file
for x in {01..09}; do
    echo "barcode$x" "barcode$x.run1.fastq"
done | tr " " "\t" > NSPbatch.batch

# test tsv status
cut -f2 NSPbatch.batch

# there are no TRUE statements, just invoking = TRUE, or invoke False
# OK these parameters are working well
CRISPResso --fastq_r1 barcode01.run1.fastq --amplicon_seq ACGAAAAGTCATGGCAAGTCATAGAAAGATCGCGAAAAATACTAATTAATGATTTTGAAAATGATAGGATCTGATTGTTTCCTTGATAACATTTGAATATATAAACTCGACACCTGTGAAATAAATCAATTAACACTAATAAAATGAAAGGTGTTGTAGTCTTCTTAGCCCTCGCGGCTTTGGGGAGCGCTAAGCCTCGTCTGTTCGAGACGTTCCAAGACCACTTTCAACACTTTTTGGACATAAGCAATGCCTTGGAGGGTGCCCATTGGAGACGACAACAGGGTCAGGGGTACACTCCTAACCCAGAATACATCGAAATGTTGAACAAGCTGAGCGAGCAAAACTTGAAACAGATGCTCGCTGATTTAAAAAAGGAGCCTGAAGTGCAAGACGTGAGTACCTTATACATTTATATACTAGCCTCAAAATTGTTTGAAATAAATATTTTTACAAAGAATAACTGATTCGATTTGGACATTGCACAACCTCGTT -p 4 -g CTTCTTAGCCCTCGCGGCTTTGG -wc -3 -w 10 --zip_output --plot_window_size 30 --place_report_in_output_folder
CRISPResso --fastq_r1 barcode04.run1.fastq --amplicon_seq ACGAAAAGTCATGGCAAGTCATAGAAAGATCGCGAAAAATACTAATTAATGATTTTGAAAATGATAGGATCTGATTGTTTCCTTGATAACATTTGAATATATAAACTCGACACCTGTGAAATAAATCAATTAACACTAATAAAATGAAAGGTGTTGTAGTCTTCTTAGCCCTCGCGGCTTTGGGGAGCGCTAAGCCTCGTCTGTTCGAGACGTTCCAAGACCACTTTCAACACTTTTTGGACATAAGCAATGCCTTGGAGGGTGCCCATTGGAGACGACAACAGGGTCAGGGGTACACTCCTAACCCAGAATACATCGAAATGTTGAACAAGCTGAGCGAGCAAAACTTGAAACAGATGCTCGCTGATTTAAAAAAGGAGCCTGAAGTGCAAGACGTGAGTACCTTATACATTTATATACTAGCCTCAAAATTGTTTGAAATAAATATTTTTACAAAGAATAACTGATTCGATTTGGACATTGCACAACCTCGTT -p 4 -g CTTCTTAGCCCTCGCGGCTTTGG -wc -3 -w 10 --zip_output --plot_window_size 30 --place_report_in_output_folder

scp chrwhe@duke.zoologi.su.se:/mnt/griffin/chrwhe/ONT_testing/espresso_testing/CRISPResso_on_barcode01.run1.zip .

#######
# batch test
CRISPRessoBatch --batch_settings NSPbatch.batch --amplicon_seq ACGAAAAGTCATGGCAAGTCATAGAAAGATCGCGAAAAATACTAATTAATGATTTTGAAAATGATAGGATCTGATTGTTTCCTTGATAACATTTGAATATATAAACTCGACACCTGTGAAATAAATCAATTAACACTAATAAAATGAAAGGTGTTGTAGTCTTCTTAGCCCTCGCGGCTTTGGGGAGCGCTAAGCCTCGTCTGTTCGAGACGTTCCAAGACCACTTTCAACACTTTTTGGACATAAGCAATGCCTTGGAGGGTGCCCATTGGAGACGACAACAGGGTCAGGGGTACACTCCTAACCCAGAATACATCGAAATGTTGAACAAGCTGAGCGAGCAAAACTTGAAACAGATGCTCGCTGATTTAAAAAAGGAGCCTGAAGTGCAAGACGTGAGTACCTTATACATTTATATACTAGCCTCAAAATTGTTTGAAATAAATATTTTTACAAAGAATAACTGATTCGATTTGGACATTGCACAACCTCGTT -p 4 -g CTTCTTAGCCCTCGCGGCTTTGG -wc -3 -w 10 --zip_output --plot_window_size 30 --place_report_in_output_folder
barcode01       barcode01.run1.fastq
barcode02       barcode02.run1.fastq
barcode03       barcode03.run1.fastq
barcode04       barcode04.run1.fastq
barcode05       barcode05.run1.fastq
barcode06       barcode06.run1.fastq
barcode07       barcode07.run1.fastq
barcode08       barcode08.run1.fastq
barcode09       barcode09.run1.fastq
# fail
ERROR: fastq_r1 must be specified in the batch settings file. Current headings are: <StringArray>
['barcode01', 'barcode01.run1.fastq']

head NSPbatch.batch
name	fastq_r1
barcode01       barcode01.run1.fastq
barcode02       barcode02.run1.fastq
barcode03       barcode03.run1.fastq
barcode04       barcode04.run1.fastq
barcode05       barcode05.run1.fastq
barcode06       barcode06.run1.fastq
barcode07       barcode07.run1.fastq
barcode08       barcode08.run1.fastq
barcode09       barcode09.run1.fastq

# this revised batch file, with only two columns but with header, now runs
CRISPRessoBatch --batch_settings NSPbatch.batch --amplicon_seq ACGAAAAGTCATGGCAAGTCATAGAAAGATCGCGAAAAATACTAATTAATGATTTTGAAAATGATAGGATCTGATTGTTTCCTTGATAACATTTGAATATATAAACTCGACACCTGTGAAATAAATCAATTAACACTAATAAAATGAAAGGTGTTGTAGTCTTCTTAGCCCTCGCGGCTTTGGGGAGCGCTAAGCCTCGTCTGTTCGAGACGTTCCAAGACCACTTTCAACACTTTTTGGACATAAGCAATGCCTTGGAGGGTGCCCATTGGAGACGACAACAGGGTCAGGGGTACACTCCTAACCCAGAATACATCGAAATGTTGAACAAGCTGAGCGAGCAAAACTTGAAACAGATGCTCGCTGATTTAAAAAAGGAGCCTGAAGTGCAAGACGTGAGTACCTTATACATTTATATACTAGCCTCAAAATTGTTTGAAATAAATATTTTTACAAAGAATAACTGATTCGATTTGGACATTGCACAACCTCGTT -p 4 -g CTTCTTAGCCCTCGCGGCTTTGG -wc -3 -w 10 --zip_output --plot_window_size 30 --place_report_in_output_folder
# seems to use all cores given but in serial
# now trying with 40
CRISPRessoBatch --batch_settings NSPbatch.batch --amplicon_seq ACGAAAAGTCATGGCAAGTCATAGAAAGATCGCGAAAAATACTAATTAATGATTTTGAAAATGATAGGATCTGATTGTTTCCTTGATAACATTTGAATATATAAACTCGACACCTGTGAAATAAATCAATTAACACTAATAAAATGAAAGGTGTTGTAGTCTTCTTAGCCCTCGCGGCTTTGGGGAGCGCTAAGCCTCGTCTGTTCGAGACGTTCCAAGACCACTTTCAACACTTTTTGGACATAAGCAATGCCTTGGAGGGTGCCCATTGGAGACGACAACAGGGTCAGGGGTACACTCCTAACCCAGAATACATCGAAATGTTGAACAAGCTGAGCGAGCAAAACTTGAAACAGATGCTCGCTGATTTAAAAAAGGAGCCTGAAGTGCAAGACGTGAGTACCTTATACATTTATATACTAGCCTCAAAATTGTTTGAAATAAATATTTTTACAAAGAATAACTGATTCGATTTGGACATTGCACAACCTCGTT -p 40 -g CTTCTTAGCCCTCGCGGCTTTGG -wc -3 -w 10 --zip_output --plot_window_size 30 --place_report_in_output_folder


# thoughts
# I'm concerned about the way that the reads are being trimmed and filtered

# I'm concerned that the shotgun nature of the reads inflates the estimates of deletions if reads are not fully crossing the 
# target site

scp chrwhe@duke.zoologi.su.se:/mnt/griffin/chrwhe/ONT_testing/espresso_testing/CRISPRessoBatch_on_NSPbatch.zip .

####
for x in {01..24}; do
    echo "barcode$x" "barcode$x.run1.fastq"
done


#####
# parameter space
--default_min_aln_score (default is 60, not sure if this is MAPQ or not)
--file_prefix
-o, --output_folder
--samtools_exclude_flags (deafult is 4, unmapped)
--exclude_bp_from_left  Exclude bp from the left side of the amplicon sequence for the quantification of the indels
    Type: int   Default: 15
--use_legacy_insertion_quantification  If set, the legacy insertion quantification method will be used (i.e. with a 1bp quantification window, indels at the cut site and 1bp away from the cut site would be quantified). By default (if this parameter is not set) with a 1bp quantification window, only insertions at the cut site will be quantified.
    Type: bool  Default: False
-qwc, --quantification_window_coordinates

--bam_input
-bo, --batch_output_folder
-w, --quantification_window_size, --window_around_sgrna
    Help: Defines the size (in bp) of the quantification window extending from the position specified by the '--cleavage_offset' or '--quantification_window_center' parameter in relation to the provided guide RNA sequence(s) (--sgRNA). Mutations within this number of bp from the quantification window center are used in classifying reads as modified or unmodified. A value of 0 disables this window and indels in the entire amplicon are considered. Default is 1, 1bp on each side of the cleavage position for a total length of 2bp. Multiple quantification window sizes (corresponding to each guide specified by --guide_seq) can be specified with a comma-separated list.



#################### 
# online run stuff
# 
# default
CRISPResso -o CRISPRessoBatch_on_p4t5ty4g --name Sample_1 --aln_seed_min 2 --default_min_aln_score 60 --prime_editing_pegRNA_scaffold_min_match_length 1 --conversion_nuc_to T --write_cleaned_report --needleman_wunsch_gap_open -20 --min_single_bp_quality 0 --guide_seq CTTCTTAGCCCTCGCGGCTTTGG --prime_editing_gap_open_penalty -50 --max_rows_alleles_around_cut_to_plot 50 --needleman_wunsch_gap_extend -2 --exclude_bp_from_left 15 --plot_window_size 20 --n_processes 2 --verbosity 3 --exclude_bp_from_right 15 --fastq_r1 CRISPResso_Input_Reads_63c99470-2dfd-4b0d-a7a4-31622501a450.fastq --flash_command None --min_bp_quality_or_N 0 --use_matplotlib --min_paired_end_reads_overlap 10 --min_frequency_alleles_around_cut_to_plot 0.2 --flexiguide_homology 80 --aln_seed_len 10 --fastp_command fastp --config_file None --needleman_wunsch_aln_matrix_loc EDNAFULL --place_report_in_output_folder --flexiguide_gap_extend_penalty -2 --amplicon_name Reference --needleman_wunsch_gap_incentive 1 --quantification_window_center -3 --min_average_read_quality 0 --prime_editing_gap_extend_penalty 0 --conversion_nuc_from C --amplicon_seq GCGATAAAATAAAAACTTCAAGAAGATAAGGTAGTTAAGATGACTTTTAATAAATACGAAAAGTCATGGCAAGTCATAGAAAGATCGCGAAAAATACTAATTAATGATTTTGAAAATGATAGGATCTGATTGTTTCCTTGATAACATTTGAATATATAAACTCGACACCTGTGAAATAAATCAATTAACACTAATAAAATGAAAGGTGTTGTAGTCTTCTTAGCCCTCGCGGCTTTGGGGAGCGCTAAGCCTCGTCTGTTCGAGACGTTCCAAGACCACTTTCAACACTTTTTGGACATAAGCAATGCCTTGGAGGGTGCCCATTGGAGACGACAACAGGGTCAGGGGTACACTCCTAACCCAGAATACATCGAAATGTTGAACAAGCTGAGCGAGCAAAACTTGAAACAGATGCTCGCTGATTTAAAAAAGGAGCCTGAAGTGCAAGACGTGAGTACCTTATACATTTATATACTAGCCTCAAAATTGTTTGAAATAAATATTTTTACAAAGAATAACTGATTCGATTTGGACATTGCACAACCTCGTTCATAAAGGAGACTGTAGAATCACGGAATATGTTAATAGTGAGTCTTGTGTATAAAAAGCAACTGAAACTTACTTCAACCATAACGCGATTGGCTCGATGTGTGTGGAAGGCAAATCACAAATAAAATTCAAGTCAAATTTACAAAATAT --quantification_window_size 1 --prime_editing_pegRNA_extension_quantification_window_size 5 --aln_seed_count 5 --flexiguide_seq None --trimmomatic_command None --max_paired_end_reads_overlap None --flexiguide_gap_open_penalty -20
# online, nice analysisl
CRISPResso -o CRISPRessoBatch_on_r5pp5dvc --name Sample_1 --needleman_wunsch_gap_incentive 1 --min_frequency_alleles_around_cut_to_plot 0.2 --amplicon_name Reference --prime_editing_pegRNA_scaffold_min_match_length 1 --quantification_window_size 10 --n_processes 2 --needleman_wunsch_gap_open -20 --max_rows_alleles_around_cut_to_plot 50 --conversion_nuc_to T --default_min_aln_score 60 --exclude_bp_from_left 15 --min_average_read_quality 0 --write_cleaned_report --fastq_r1 CRISPResso_Input_Reads_7384b453-a8f6-47d0-8384-682b7f3ff912.fastq --guide_seq CTTCTTAGCCCTCGCGGCTTTGG --needleman_wunsch_gap_extend -2 --aln_seed_count 5 --plot_window_size 20 --flexiguide_seq None --fastp_command fastp --flexiguide_gap_extend_penalty -2 --min_paired_end_reads_overlap 10 --prime_editing_gap_open_penalty -50 --flexiguide_gap_open_penalty -20 --prime_editing_gap_extend_penalty 0 --conversion_nuc_from C --aln_seed_min 2 --aln_seed_len 10 --verbosity 3 --prime_editing_pegRNA_extension_quantification_window_size 5 --use_matplotlib --place_report_in_output_folder --trimmomatic_command None --exclude_bp_from_right 15 --max_paired_end_reads_overlap None --min_bp_quality_or_N 0 --needleman_wunsch_aln_matrix_loc EDNAFULL --flexiguide_homology 80 --flash_command None --quantification_window_center -3 --config_file None --min_single_bp_quality 0 --amplicon_seq GCGATAAAATAAAAACTTCAAGAAGATAAGGTAGTTAAGATGACTTTTAATAAATACGAAAAGTCATGGCAAGTCATAGAAAGATCGCGAAAAATACTAATTAATGATTTTGAAAATGATAGGATCTGATTGTTTCCTTGATAACATTTGAATATATAAACTCGACACCTGTGAAATAAATCAATTAACACTAATAAAATGAAAGGTGTTGTAGTCTTCTTAGCCCTCGCGGCTTTGGGGAGCGCTAAGCCTCGTCTGTTCGAGACGTTCCAAGACCACTTTCAACACTTTTTGGACATAAGCAATGCCTTGGAGGGTGCCCATTGGAGACGACAACAGGGTCAGGGGTACACTCCTAACCCAGAATACATCGAAATGTTGAACAAGCTGAGCGAGCAAAACTTGAAACAGATGCTCGCTGATTTAAAAAAGGAGCCTGAAGTGCAAGACGTGAGTACCTTATACATTTATATACTAGCCTCAAAATTGTTTGAAATAAATATTTTTACAAAGAATAACTGATTCGATTTGGACATTGCACAACCTCGTTCATAAAGGAGACTGTAGAATCACGGAATATGTTAATAGTGAGTCTTGTGTATAAAAAGCAACTGAAACTTACTTCAACCATAACGCGATTGGCTCGATGTGTGTGGAAGGCAAATCACAAATAAAATTCAAGTCAAATTTACAAAATAT

# quantification_window_size default is 1, but I extened to 10 and it was much improved.
 [-w QUANTIFICATION_WINDOW_SIZE]


Parameters:

allele_plot_pcts_only_for_assigned_reference: False
aln_seed_count: 5
aln_seed_len: 10
aln_seed_min: 2
amplicon_min_alignment_score: 
amplicon_name: Reference
amplicon_seq: GCGATAAAATAAAAACTTCAAGAAGATAAGGTAGTTAAGATGACTTTTAATAAATACGAAAAGTCATGGCAAGTCATAGAAAGATCGCGAAAAATACTAATTAATGATTTTGAAAATGATAGGATCTGATTGTTTCCTTGATAACATTTGAATATATAAACTCGACACCTGTGAAATAAATCAATTAACACTAATAAAATGAAAGGTGTTGTAGTCTTCTTAGCCCTCGCGGCTTTGGGGAGCGCTAAGCCTCGTCTGTTCGAGACGTTCCAAGACCACTTTCAACACTTTTTGGACATAAGCAATGCCTTGGAGGGTGCCCATTGGAGACGACAACAGGGTCAGGGGTACACTCCTAACCCAGAATACATCGAAATGTTGAACAAGCTGAGCGAGCAAAACTTGAAACAGATGCTCGCTGATTTAAAAAAGGAGCCTGAAGTGCAAGACGTGAGTACCTTATACATTTATATACTAGCCTCAAAATTGTTTGAAATAAATATTTTTACAAAGAATAACTGATTCGATTTGGACATTGCACAACCTCGTTCATAAAGGAGACTGTAGAATCACGGAATATGTTAATAGTGAGTCTTGTGTATAAAAAGCAACTGAAACTTACTTCAACCATAACGCGATTGGCTCGATGTGTGTGGAAGGCAAATCACAAATAAAATTCAAGTCAAATTTACAAAATAT
annotate_wildtype_allele: 
assign_ambiguous_alignments_to_first_reference: False
auto: False
bam_chr_loc: 
bam_input: 
bam_output: False
base_editor_output: False
bowtie2_index: 
coding_seq: 
config_file: None
conversion_nuc_from: C
conversion_nuc_to: T
crispresso1_mode: False
crispresso_merge: False
debug: False
default_min_aln_score: 60
disable_guardrails: False
discard_guide_positions_overhanging_amplicon_edge: False
discard_indel_reads: False
display_name: 
dsODN: 
dump: False
exclude_bp_from_left: 15
exclude_bp_from_right: 15
expand_allele_plots_by_quantification: False
expand_ambiguous_alignments: False
expected_hdr_amplicon_seq: 
fastp_command: fastp
fastp_options_string: 
fastq_output: False
fastq_r1: CRISPResso_Input_Reads_7384b453-a8f6-47d0-8384-682b7f3ff912.fastq
fastq_r2: 
file_prefix: 
flash_command: None
flexiguide_gap_extend_penalty: -2
flexiguide_gap_open_penalty: -20
flexiguide_homology: 80
flexiguide_name: 
flexiguide_seq: None
force_merge_pairs: False
guide_name: 
guide_seq: CTTCTTAGCCCTCGCGGCTTTGG
halt_on_plot_fail: False
ignore_deletions: False
ignore_insertions: False
ignore_substitutions: False
keep_intermediate: False
max_paired_end_reads_overlap: None
max_rows_alleles_around_cut_to_plot: 50
min_average_read_quality: 0
min_bp_quality_or_N: 0
min_frequency_alleles_around_cut_to_plot: 0.2
min_paired_end_reads_overlap: 10
min_single_bp_quality: 0
n_processes: 2
name: Sample_1
needleman_wunsch_aln_matrix_loc: EDNAFULL
needleman_wunsch_gap_extend: -2
needleman_wunsch_gap_incentive: 1
needleman_wunsch_gap_open: -20
no_rerun: False
output_folder: CRISPRessoBatch_on_r5pp5dvc
place_report_in_output_folder: True
plot_histogram_outliers: False
plot_window_size: 20
prime_editing_gap_extend_penalty: 0
prime_editing_gap_open_penalty: -50
prime_editing_nicking_guide_seq: 
prime_editing_override_prime_edited_ref_seq: 
prime_editing_override_sequence_checks: False
prime_editing_pegRNA_extension_quantification_window_size: 5
prime_editing_pegRNA_extension_seq: 
prime_editing_pegRNA_scaffold_min_match_length: 1
prime_editing_pegRNA_scaffold_seq: 
prime_editing_pegRNA_spacer_seq: 
quantification_window_center: -3
quantification_window_coordinates: None
quantification_window_size: 10
samtools_exclude_flags: 0
save_also_png: False
split_interleaved_input: False
stringent_flash_merging: False
suppress_amplicon_name_truncation: False
suppress_plots: False
suppress_report: False
trim_sequences: False
trimmomatic_command: None
trimmomatic_options_string: 
use_legacy_insertion_quantification: False
use_matplotlib: True
verbosity: 3
write_cleaned_report: True
write_detailed_allele_table: False
zip_output: False