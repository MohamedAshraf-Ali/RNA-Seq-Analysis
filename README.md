# RNA-Seq-Analysis
Reproducible RNA-seq analysis pipeline and differential gene expression workflows in R - Reproduction of Amorim et al. (2019)
Overview

This repository contains my reproduction of selected RNA-seq analyses from the following paper:
Amorim CF, Novais FO, Nguyen BT, Misic AM, Carvalho LP, Carvalho EM, Beiting DP, Scott P. (2019).
Variable gene expression and parasite load predict treatment outcome in cutaneous leishmaniasis.
Science Translational Medicine, 11(519), eaax4204.
DOI: 10.1126/scitranslmed.aax4204
The original study investigated gene expression and parasite load in patients with cutaneous leishmaniasis and their relationship with treatment outcome.

This project focuses on reproducing the RNA-seq computational analysis using the publicly available data associated with the study.

Analysis

The analysis follows the RNA-seq workflow from raw sequencing data through downstream gene expression analysis.

1. Raw RNA-seq Data
RNA-seq data associated with the original study were obtained from the publicly available dataset.

2. Read Preprocessing
Raw sequencing reads were processed before transcript quantification.

3. Kallisto Quantification
Kallisto was used to quantify transcript abundance from the processed RNA-seq reads.
The resulting abundance.tsv files were used for downstream analysis.

4. Transcript-to-Gene Summarization
Kallisto transcript-level quantification was imported into R using TxImport.
Transcript annotation was used to summarize transcript-level estimates to the gene level.

5. Filtering and Normalization
Lowly expressed genes were filtered from the expression matrix.
The remaining expression data were normalized using TMM normalization from edgeR.

6. Exploratory Analysis
Sample-level expression patterns were explored using:
Hierarchical clustering
Principal Component Analysis (PCA)

8. Differential Expression Analysis
Differential expression analysis was performed using the limma-voom framework.
The analysis compared the study groups used in the reproduced analysis.

8. DEG Clustering and Module Identification
Differentially expressed genes were clustered according to their expression patterns.
Heatmaps were generated to visualize the resulting gene modules.

9. Gene Ontology Enrichment
Gene Ontology enrichment analysis was performed using gProfiler2 for the identified gene sets.

10. Gene Set Enrichment Analysis
clusterProfiler was used to perform GSEA using ranked gene expression results and predefined gene sets.

11. Comparison with the Original Paper
The reproduced results and visualizations are compared with the corresponding analyses reported in the original publication.
The goal is to evaluate whether the main computational findings of the published analysis can be reproduced using the available data and analysis workflow.

Data Availability
The original study reports that the RNA-seq data and clinical metadata were archived on Zenodo under DOI 10.5281/zenodo.3374884. The authors also provided a reproducible Code Ocean capsule containing the computational analysis.

Raw FASTQ files are not included in this repository.
