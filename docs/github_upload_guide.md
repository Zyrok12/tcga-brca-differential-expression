# GitHub Upload Guide

## Recommended repository name

Use one of these:

```text
tcga-brca-differential-expression
tcga-brca-rnaseq-analysis
brca-dea-r
```

Best choice:

```text
tcga-brca-differential-expression
```

## Recommended short description

```text
RNA-seq differential expression analysis of TCGA-BRCA breast cancer data using R, DESeq2, survival analysis, LASSO classification and GO enrichment.
```

## Suggested GitHub topics

Add these as repository topics:

```text
bioinformatics
r
bioconductor
tcga
brca
rnaseq
deseq2
differential-expression
survival-analysis
lasso
gene-ontology
cancer-genomics
```

## How to upload from your computer

```bash
git init
git add .
git commit -m "Initial commit: TCGA-BRCA differential expression analysis"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/tcga-brca-differential-expression.git
git push -u origin main
```

## What to do before pushing

1. Replace `YOUR_USERNAME` in the README clone URL.
2. Check that no large data files are included.
3. Check that `GDCdata/` is not committed.
4. Open the R Markdown file and confirm it runs chunk by chunk.
5. Add screenshots of plots later if you want the README to look more visual.

## Optional future improvements

- Add exported figures to `results/figures/`.
- Add a rendered HTML report through GitHub Pages.
- Add a small `results/tables/deg_summary.csv` file.
- Add a `renv.lock` file for exact package reproducibility.
- Add screenshots to the README.
