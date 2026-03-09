# ONT CRISPR Amplicon Sequencing — NSP Project

Nanopore sequencing of CRISPR-Cas9 edited *Pieris brassicae* NSP gene — 24 barcoded amplicon libraries on MinION.

**[View the project page →](https://bioinfowheat.github.io/ONT-CRISPR-NSP/)**

## Quick Start

```bash
# Install tools
brew install minimap2 samtools fastqc

# Align a barcode
minimap2 -a -x map-ont --MD NSP_genomic_ref.mmi barcode01/*.fastq.gz | \
  samtools sort -o barcode01_aligned.bam -
samtools index barcode01_aligned.bam
```

See the [project page](https://bioinfowheat.github.io/ONT-CRISPR-NSP/) for full details.
