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

########
# or GNU parallel
# -j indicates number of jobs to run in parallel
# since each job uses 2 threads, this will use up to 10 cores 

# --dryrun command shows the individual commands that are sent to the cores
for i in {1..24} ; do echo $i ; done | parallel -j 5 --dryrun 'fastp -i barcode{}.combined.fastq.gz -o barcode{}.combined.cleaned.fastq.gz --qualified_quality_phred 8 --length_required 200 --thread 2 --html barcode{}.fastp_report.html --json barcode{}.fastp_report.json' 


