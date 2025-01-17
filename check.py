"""
Compare variants against a lineage

- VCF input from STDIN
- TSV with lineage mutations - 1st argument
  Columns have to be:
  1. Position
  2. Name
  3. Wild type (Ref)
  4. SNP mutation (Alt)
- Lineage name - 2nd argument

Intentionally uses only built-in Python, to avoid dependencies
"""

import sys
import csv


def lineage(f):
    """Load lineage mutation TSV."""
    with open(f) as file:
        return {m[0]: (m[2], m[3]) for m in csv.reader(file, delimiter="\t")}


filearg, lineage_name = sys.argv[1:]
d = lineage(filearg)

# Counting both matching SNPs and WT
wt = 0
snp = 0
result = []

for line in sys.stdin:
    # Skip headers
    if line.startswith("#"):
        continue

    parts = line.strip().split("\t")
    pos, ref, alt = parts[1], parts[3], parts[4]

    # Look up mutation
    if pos in d:
        r, a = d[pos]
        if ref == r and alt == a:
            result.append(line.strip())
            snp += 1
    if alt == ".":
        wt += 1

# Format lineage from the filename
print(f"{lineage_name}\tSNP={snp}; WT={wt}")
for r in result:
    print(f"{lineage_name}\t{r}")
