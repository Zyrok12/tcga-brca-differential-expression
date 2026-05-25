# Data

This project downloads TCGA-BRCA RNA-seq data directly from the Genomic Data Commons using `TCGAbiolinks`.

Large downloaded files are not stored in this repository.

When you run the R Markdown workflow, `TCGAbiolinks` may create a local folder such as:

```text
GDCdata/
```

This folder is ignored by Git because it can become large.
