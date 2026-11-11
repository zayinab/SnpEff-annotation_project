#!/bin/bash
# One row per variant, using the first SnpEff annotation
bcftools query -f '%POS\t%REF\t%ALT\t%QUAL\t%INFO/ANN\n' results/SRR2584863.annotated.vcf \
 | awk -F'\t' 'BEGIN{print "pos\tref\talt\tqual\teffect\timpact\tgene\thgvs_c\thgvs_p"}
   {split($5,a,","); split(a[1],b,"|");
    print $1"\t"$2"\t"$3"\t"$4"\t"b[2]"\t"b[3]"\t"b[4]"\t"b[10]"\t"b[11]}' \
 > results/variant_effects.tsv
echo "Effect counts:"
bcftools query -f '%INFO/ANN\n' results/SRR2584863.annotated.vcf | cut -d'|' -f2 | sort | uniq -c | sort -rn
