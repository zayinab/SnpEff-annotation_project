# SnpEff Annotation of E. coli Variants

Annotates the 24 filtered variants of an evolved *E. coli* sample
(SRR2584863, called against the ancestor REL606) with SnpEff, using a
database built from the GenBank record CP000819.1. A mapping-quality
filter then removes 4 low-confidence calls.

Continues the workflow in
[ecoli-variant-calling](https://github.com/zayinab/ecoli-variant-calling).

## Pipeline
```bash
conda activate variants
bash scripts/01_get_genbank.sh  # download GenBank annotation
bash scripts/02_annotate.sh     # build SnpEff database and annotate
bash scripts/03_summarize.sh    # variant table and effect counts
bash scripts/04_filter_mq.sh    # remove calls with MQ < 40
```

## Results
| Effect | All 24 variants | MQ >= 40 (20 variants) |
|---|---|---|
| missense_variant | 16 | 12 |
| upstream_gene_variant | 5 | 5 |
| frameshift_variant | 2 | 2 |
| downstream_gene_variant | 1 | 1 |

Files: `results/variant_effects.tsv`, `results/SRR2584863.annotated.vcf`,
`results/SRR2584863.annotated.mq40.vcf`, `results/snpeff_summary.html`.

Missense variants kept after filtering (12): yaaH (Asn174Thr), mrdB (Arg69His),
topA (Thr792Lys), pykF (Asp127Asn), rplS (Leu100Gln), fis (Tyr51Ser),
rpsG (Arg78Leu), malT (Thr46Ala), glpR (Ser180Ala), hslU (Ser350Pro),
iclR (Leu201Arg), nadR (Tyr337Ser).

High-impact frameshifts: ybaL (c.1401_1402insGC, p.Ala469fs) and
ytfN (c.3526_3527delGG, p.Gly1176fs).

## Caveats
- **IS elements:** four missense calls in insB genes (insB-3, insB-5,
  insB-18, insB-19) had mapping quality 22-26, while all other variants had
  MQ 60. Two of them share the identical change c.195G>T (p.Arg65Ser). IS1
  copies are near-identical, so these are likely mapping artifacts and were
  removed by the MQ filter.
- **Repeat-associated indels:** the ybaL frameshift lies in a short GC repeat
  and the insL-2 variant in a homopolymer. They have MQ 60 but are still
  error-prone for short-read callers and should be checked in IGV.
- **Distance to genes:** yagW, ypdG, speC and elaC calls are about 4.5-4.9 kb
  from their gene, so they are effectively intergenic. Only hdfR (40 bp
  upstream) is close.
- Only the first SnpEff annotation per variant is reported.
- One sample, no replicates and no functional validation.

## Environment
See `environment.yml`.

## Author
Zainab, M.Sc. Bioinformatics, Jamia Millia Islamia
