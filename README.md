# M1 clone lineage detection

Basic variant calling of lineage SNPs for Illumina sequencing data

Dependencies 
- minimap2
- bcftools
- Python 3 (only standard library)

# Build Docker container and run 

``` shell
docker build . -t m1_lineage
docker run -it -w /usr/src/app -v $(pwd):/usr/src/app -v $(pwd)/_data:/usr/src/data m1_lineage ./lineage.sh /usr/src/data/ERR473577_1.fastq.gz /usr/src/data/ERR473577_2.fastq.gz
```

# Tested samples
From Supplementary file for manuscript "Characterisation of emergent toxigenic M1UK
Streptococcus pyogenes and associated sublineages"

https://doi.org/10.1099/mgen.0.000994

```
| ERR2864947  | Sharma et al.                | Unknown      | M1global | UK 2017 |            | ✅                      |
| ERR2864949  | Sharma et al.                | Unknown      | M1global | UK 2017 |            | ✅                      |
| ERR2864950  | Sharma et al.                | Outbreak     | 23 SNPs  | UK 2017 |            | ✅                      |
| ERR2864948  | Sharma et al.                | Unknown      | M1uk     | UK 2017 |            | ✅                      |
| ERS4267588  | This Study                   | Outbreak     | 26 SNPs  | UK 2018 | ERR3840965 | ❌ Finds all 27 UK SNPs |
| ERS4267589  | This Study                   | Outbreak     | 27 SNPs  | UK 2018 | ERR3840966 | ✅                      |
| ERS1448799  | Kapatai et al.               | Invasive     | 13 SNPs  | UK 2014 | ERR1734874 | ✅                      |
| ERS1448193  | Kapatai et al.               | Invasive     | 23 SNPs  | UK 2014 | ERR1732882 | ✅                      |
| ERS1448173  | Kapatai et al.               | Invasive     | M1global | UK 2014 | ERR1734401 | ✅                      |
| ERS1020090  | Lynskey & Jauneikaite et al. | Non invasive | M1uk     | UK 2011 | ERR1515483 | ✅                      |
| ERS1594714  | Lynskey & Jauneikaite et al. | Invasive     | 13 SNPs  | UK 2013 | ERR2532996 | ✅                      |
| ERS1594824  | Lynskey & Jauneikaite et al. | Invasive     | 23 SNPs  | UK 2013 | ERR2533104 | ✅                      |
| ERS1594782  | Lynskey & Jauneikaite et al. | Invasive     | M1global | UK 2013 | ERR2533064 | ✅ Finds 1 DK SNP       |
| ERS1594786  | Lynskey & Jauneikaite et al. | Invasive     | M1uk     | UK 2013 | ERR2533068 | ✅                      |
| ERS1463088  | Lynskey & Jauneikaite et al. | Non invasive | M1uk     | UK 2016 | ERR2396423 | ✅                      |
| ERS1463121  | Lynskey & Jauneikaite et al. | Non invasive | M1uk     | UK 2016 | ERR2396453 | ✅                      |
| ERS361960   | Turner et al.                | Invasive     | 13 SNPs  | UK 2005 | ERR473577  | ✅                      |
| ERS379360   | Turner et al.                | Invasive     | M1global | UK 2006 | ERR485885  | ✅                      |
|------------+------------------------------+--------------+----------+---------+------------+--------------------------|
| ERR11482909 |                              |              | M1dk     |         |            | ✅                      |
```

M1 DK 
https://doi.org/10.2807/1560-7917.ES.2023.28.26.2300291

