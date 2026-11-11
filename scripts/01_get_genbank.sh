#!/bin/bash
# GenBank record for E. coli REL606 (contains genes, CDS and the sequence)
wget -O data/CP000819.1.gbk "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nuccore&id=CP000819.1&rettype=gbwithparts&retmode=text"
head -1 data/CP000819.1.gbk
echo "CDS features: $(grep -c '^     CDS ' data/CP000819.1.gbk)"
