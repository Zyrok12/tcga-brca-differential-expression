## install_packages.R
## Installs the main CRAN and Bioconductor packages needed for the TCGA-BRCA analysis.

if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager")
}

bioc_packages <- c(
  "TCGAbiolinks",
  "SummarizedExperiment",
  "DESeq2",
  "EnhancedVolcano",
  "clusterProfiler",
  "org.Hs.eg.db",
  "enrichplot"
)

cran_packages <- c(
  "tidyverse",
  "survival",
  "survminer",
  "pheatmap",
  "glmnet",
  "caret",
  "ggplot2",
  "stringr"
)

for (pkg in cran_packages) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    install.packages(pkg)
  }
}

for (pkg in bioc_packages) {
  if (!requireNamespace(pkg, quietly = TRUE)) {
    BiocManager::install(pkg, ask = FALSE, update = FALSE)
  }
}

message("Package installation/check complete.")
