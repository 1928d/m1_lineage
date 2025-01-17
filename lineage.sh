#!/usr/bin/env bash
set -e
DIR=`mktemp -d -p /tmp`

REF="CP000017.2.fa"
FQ1=$1
FQ2=$2

# Copy reference to TMP dir
cp $REF $DIR/$REF

# Map reads
minimap2 -t8 -ax sr $DIR/$REF $FQ1 $FQ2 | samtools sort -@4 > $DIR/sample.sort.bam

# Call variants
bcftools mpileup --threads 4 -I -q 60 -Q 20 --annotate "FORMAT/AD,INFO/AD" -d 1000 \
    -Ou -f $DIR/$REF $DIR/sample.sort.bam | \
    bcftools call --threads 4 -v -m -Oz --ploidy 1 -o $DIR/sample.vcf.gz

# Generate BED files
python make_bed.py CP000017.2 < m1uk_position.tsv > $DIR/m1uk.bed
python make_bed.py CP000017.2 < m1dk_position.tsv > $DIR/m1dk.bed

# Compare SNPs against lineages
bcftools index $DIR/sample.vcf.gz
bcftools view -R $DIR/m1uk.bed $DIR/sample.vcf.gz | python check.py m1uk_position.tsv "M1UK"
bcftools view -R $DIR/m1dk.bed $DIR/sample.vcf.gz | python check.py m1dk_position.tsv "M1DK"
