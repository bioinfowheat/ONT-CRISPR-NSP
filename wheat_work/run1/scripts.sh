# we assess reads using fastqc

# just pasted fasta file into 4interns folder
# need to chang permissions
sudo chown :general -R /mnt/griffin/4interns
sudo chmod 550 -R /mnt/griffin/4interns


# FastQC
chmod 777 /mnt/griffin/chrwhe/software/fastqc

# make the output folder
mkdir results
# then run
/mnt/griffin/chrwhe/software/FastQC/fastqc run1_fastq_files/*.fastq.gz -o results --threads 10
# results folder is now full of HTML files

# zip these
zip raw_fastqc.zip *html
# download to your local computer to view
scp chrwhe@duke.zoologi.su.se:/mnt/griffin/chrwhe/ONT_testing/results/raw_fastqc.zip .

# trim the reads
fastp \
  -i input.fastq.gz \
  -o output_clean.fastq.gz \
  --qualified_quality_phred 8 \
  --length_required 200 \
  --thread 4 \
  --html fastp_report.html \
  --json fastp_report.json

# make folder for cleaned reads
mkdir results/trimmed_fastq

# to loop over all samples
FASTQ_BASE="run1_fastq_files"
OUTDIR="results/trimmed_fastq"

for i in $(seq -w 1 24); do
  BC="barcode${i}"
  fastp \
    -i "$FASTQ_BASE/$BC"/*.fastq.gz \
    -o "$OUTDIR/${BC}_clean.fastq.gz" \
    --qualified_quality_phred 8 \
    --length_required 200 \
    --thread 4 \
    --html "$OUTDIR/${BC}_fastp.html" \
    --json "$OUTDIR/${BC}_fastp.json"
done

# make the reference for mapping reads against
/mnt/griffin/chrwhe/software/minimap2/minimap2 -d NSP_genomic_ref.mmi NSP_genomic_ref.fasta

# Align a barcode to reference (ONT preset, output sorted BAM)
minimap2 -a -x map-ont --MD NSP_genomic_ref.mmi barcode01/*.fastq.gz | \
  samtools sort -o barcode01_aligned.bam -
# index

/mnt/griffin/chrwhe/software/samtools-1.10/samtools index barcode01_aligned.bam



