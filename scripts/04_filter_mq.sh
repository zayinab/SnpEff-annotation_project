#!/bin/bash
# Remove low mapping-quality calls (MQ < 40), e.g. in repeated IS elements
bcftools filter -e 'INFO/MQ<40' results/SRR2584863.annotated.vcf -o results/SRR2584863.annotated.mq40.vcf
echo "Before: $(grep -vc '^#' results/SRR2584863.annotated.vcf)  After: $(grep -vc '^#' results/SRR2584863.annotated.mq40.vcf)"
bcftools query -f '%INFO/ANN\n' results/SRR2584863.annotated.mq40.vcf | cut -d'|' -f2 | sort | uniq -c | sort -rn
