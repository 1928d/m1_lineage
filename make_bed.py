"""
Read a TSV file from STDIN with lineage positions and generate a BED file

cat TSV | python make_bed.py REF

Example
cat m1uk_position.tsv | python make_bed.py CP000017.2
"""

import sys

ref = sys.argv[1]
for line in sys.stdin:
    pos, name, ref_allele, alt_allele = line.strip().split("\t")
    pos = int(pos)
    print(f"{ref}\t{pos-1}\t{pos}\t{name}")
