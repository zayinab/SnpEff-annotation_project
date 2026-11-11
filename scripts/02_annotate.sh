#!/bin/bash
set -e
mkdir -p snpeff_data/REL606 results
cp data/CP000819.1.gbk snpeff_data/REL606/genes.gbk
printf "data.dir = $(pwd)/snpeff_data\nREL606.genome : REL606\n" > snpEff.config
snpEff build -genbank -c snpEff.config -v REL606
snpEff -c snpEff.config -v -stats results/snpeff_summary.html REL606 \
  data/SRR2584863.filtered.vcf.gz > results/SRR2584863.annotated.vcf
