# TCGA-BRCA Differential Expression Analysis

A reproducible mini-project for analysing **breast cancer RNA-seq expression data** from **TCGA-BRCA** using R/Bioconductor.

This project performs differential expression analysis between **Primary Tumor** and **Solid Tissue Normal** samples, visualises significant genes, explores survival differences using **ERBB2** expression, trains a simple LASSO classifier, and performs Gene Ontology enrichment analysis.

---

## Project Overview

This repository contains an R Markdown workflow for:

- downloading TCGA-BRCA gene expression count data using `TCGAbiolinks`;
- preparing raw RNA-seq count data for differential expression analysis;
- comparing **Primary Tumor** vs **Solid Tissue Normal** samples with `DESeq2`;
- identifying significantly differentially expressed genes;
- generating a volcano plot and heatmap;
- performing Kaplan-Meier survival analysis using **ERBB2** expression;
- training a LASSO logistic regression classifier to distinguish tumor from normal samples;
- running Gene Ontology Biological Process enrichment analysis with `clusterProfiler`.

---

## Repository Structure

```text
.
├── BRCA_Differential_Expression_Analysis.Rmd   # Main R Markdown analysis
├── install_packages.R                          # Installs required R packages
├── README.md                                   # Project documentation
├── .gitignore                                  # Files/folders ignored by Git
├── LICENSE                                     # MIT license
├── data/
│   └── README.md                               # Data notes
├── results/
│   ├── figures/                                # Suggested location for exported plots
│   └── tables/                                 # Suggested location for exported result tables
├── scripts/
│   └── session_info.R                          # Optional reproducibility script
└── docs/
    └── project_summary.md                      # Short recruiter-friendly summary
```

---

## Data Source

The project uses publicly available RNA-seq data from the **TCGA-BRCA** project through the Genomic Data Commons.

The data are downloaded directly in R using:

```r
GDCquery(
    project = "TCGA-BRCA",
    data.category = "Transcriptome Profiling",
    data.type = "Gene Expression Quantification",
    workflow.type = "STAR - Counts"
)
```

Because the dataset is downloaded from GDC, large data files are **not included** in this repository.

---

## Main Analysis Steps

### 1. Data Download and Preparation

The workflow queries and downloads TCGA-BRCA RNA-seq count data using `TCGAbiolinks`.

```r
GDCdownload(query, method = "api", files.per.chunk = 10)
se <- GDCprepare(query)
```

The resulting `SummarizedExperiment` object contains:

- raw count matrix;
- sample metadata;
- gene metadata.

---

### 2. Differential Expression Analysis

Differential expression is performed using `DESeq2`.

Comparison:

```text
Primary Tumor vs Solid Tissue Normal
```

Filtering:

```r
keep <- rowSums(counts(dds) >= 10) >= 10
```

Significance threshold:

```text
adjusted p-value < 0.05
absolute log2 fold change > 1
```

---

### 3. Visualisation

The project includes:

- volcano plot using `EnhancedVolcano`;
- heatmap of top differentially expressed genes using `pheatmap`;
- sample annotation by tissue type.

---

### 4. Survival Analysis

The project performs Kaplan-Meier survival analysis using **ERBB2** expression in primary tumor samples.

Patients are split into:

```text
High ERBB2 expression
Low ERBB2 expression
```

A Cox proportional hazards model is also fitted to estimate the relationship between expression group and overall survival.

---

### 5. LASSO Classification

A LASSO logistic regression model is trained using `glmnet` to classify samples as:

```text
Primary Tumor
Solid Tissue Normal
```

The workflow includes:

- train/test split;
- cross-validated lambda selection;
- prediction on the test set;
- confusion matrix;
- accuracy calculation;
- extraction of non-zero LASSO-selected genes.

---

### 6. Gene Ontology Enrichment

Significant genes are converted from Ensembl IDs to Entrez IDs using `org.Hs.eg.db`.

Gene Ontology Biological Process enrichment is then performed with `clusterProfiler`.

The workflow uses all tested genes as the background universe, which is more appropriate than using all human genes as background.

---

## Requirements

This project requires R and RStudio or another R Markdown-compatible environment.

Recommended:

```text
R >= 4.3
RStudio
Bioconductor
```

Main R packages:

```text
TCGAbiolinks
SummarizedExperiment
DESeq2
EnhancedVolcano
clusterProfiler
org.Hs.eg.db
enrichplot
tidyverse
survival
survminer
pheatmap
glmnet
caret
ggplot2
stringr
```

---

## Installation

Clone the repository:

```bash
git clone https://github.com/YOUR_USERNAME/tcga-brca-dea.git
cd tcga-brca-dea
```

Install the required R packages:

```r
source("install_packages.R")
```

Then open:

```text
BRCA_Differential_Expression_Analysis.Rmd
```

and run the chunks sequentially.

---

## How to Run the Analysis

1. Open the project in RStudio.
2. Run `install_packages.R` if packages are missing.
3. Open `BRCA_Differential_Expression_Analysis.Rmd`.
4. Run the first chunks to download TCGA-BRCA data.
5. Continue through the DESeq2, visualisation, survival, LASSO, and enrichment sections.
6. Optionally export plots and tables into `results/`.

---

## Expected Outputs

The analysis generates:

- a DESeq2 results table;
- a list of significant differentially expressed genes;
- volcano plot of differential expression results;
- heatmap of top differentially expressed genes;
- Kaplan-Meier survival plot stratified by ERBB2 expression;
- Cox proportional hazards model output;
- LASSO model performance metrics;
- selected genes from the LASSO classifier;
- Gene Ontology enrichment dotplot.

---

## Notes on Reproducibility

The analysis downloads live data from GDC, so exact results may vary slightly if TCGA/GDC metadata or package versions change.

For better reproducibility, record your R session information after running the analysis:

```r
sessionInfo()
```

You can also run:

```r
source("scripts/session_info.R")
```

---

## Limitations

This is a learning-focused mini-project and should not be interpreted as a clinical model.

Important limitations:

- no external validation cohort is used;
- batch effects are not deeply modelled;
- survival analysis is exploratory;
- LASSO classification may overfit without further validation;
- clinical covariates are not fully incorporated;
- biological conclusions require additional validation.

---

## Skills

- R/Bioconductor workflow development;
- RNA-seq count data analysis;
- differential expression analysis with DESeq2;
- TCGA data retrieval using TCGAbiolinks;
- cancer genomics data interpretation;
- statistical visualisation;
- survival analysis;
- machine-learning classification with LASSO;
- pathway enrichment analysis;
- reproducible scientific reporting with R Markdown.

