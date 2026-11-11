# SnpEff Annotation of E. coli Variants

Annotates the 24 filtered variants of an evolved *E. coli* sample
(SRR2584863, called against the ancestor REL606) with SnpEff, using a
database built from the GenBank record CP000819.1.

This repository continues the variant calling workflow in
[ecoli-variant-calling](https://github.com/zayinab/ecoli-variant-calling).

## Pipeline
```bash
conda activate variants        # needs snpeff and bcftools
bash scripts/01_get_genbank.sh # download GenBank annotation
bash scripts/02_annotate.sh    # build SnpEff database and annotate
bash scripts/03_summarize.sh   # variant table and effect counts
```

## Results
24 variants (20 SNPs, 4 indels), annotated by their first SnpEff effect:

| Effect | Count |
|---|---|
| missense_variant | 16 |
| upstream_gene_variant | 5 |
| frameshift_variant | 2 |
| downstream_gene_variant | 1 |

- Full table: `results/variant_effects.tsv`
- Annotated VCF: `results/SRR2584863.annotated.vcf`
- SnpEff report: `results/snpeff_summary.html`

### Missense variants in non-IS genes (12)
yaaH (Asn174Thr), mrdB (Arg69His), topA (Thr792Lys), pykF (Asp127Asn),
rplS (Leu100Gln), fis (Tyr51Ser), rpsG (Arg78Leu), malT (Thr46Ala),
glpR (Ser180Ala), hslU (Ser350Pro), iclR (Leu201Arg), nadR (Tyr337Ser).

### High-impact variants
- ybaL: frameshift (c.1401_1402insGC, p.Ala469fs)
- ytfN: frameshift (c.3526_3527delGG, p.Gly1176fs)

## Caveats
- **IS elements:** 4 of the 16 missense calls are in insB genes (insB-3,
  insB-5, insB-18, insB-19). IS1 elements exist in several near-identical
  copies, so these calls may be mapping artifacts.
- **Repeat-associated indels:** the ybaL frameshift lies in a short GC
  repeat and the insL-2 variant in a homopolymer. Both are error-prone for
  short-read callers and should be verified (for example in IGV).
- **Distance to genes:** four upstream/downstream calls are about 4.5-4.9 kb
  from their gene (yagW, ypdG, speC, elaC), so they are effectively intergenic
  and may not be regulatory. Only hdfR (40 bp upstream) is close.
- Only the first SnpEff annotation per variant is reported in the table.
- One sample, no replicates, and no functional validation.

## Environment
See `environment.yml`.

## Author
Zainab, M.Sc. Bioinformatics, Jamia Millia Islamia
