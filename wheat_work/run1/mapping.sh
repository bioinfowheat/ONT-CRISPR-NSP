

# make the reference for mapping reads against
/mnt/griffin/chrwhe/software/minimap2/minimap2 -d NSP_genomic_ref.mmi NSP_genomic_ref.fasta

# Align a barcode to reference (ONT preset, output sorted BAM)
minimap2 -a -x map-ont --MD NSP_genomic_ref.mmi barcode01/*.fastq.gz | \
  samtools sort -o barcode01_aligned.bam -
# index

/mnt/griffin/chrwhe/software/samtools-1.10/samtools index barcode01_aligned.bam



