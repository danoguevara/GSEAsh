# Data management

## Overview

Various scripts for data retrieval and preprocessing from public data bases. This first version includes scripts to:

- Perform several Gene Set Enrichment Analysis simultaneously. Obtained and adapted from the [Broad Institute manual](https://docs.gsea-msigdb.org/).
- Merge GSEA results tsv files from different comparisons. Useful for further plotting.
- Check and count that all the analysis performed for the comparisons share the same gene sets.
- Retrieve grp files of selected gene sets from the Molecular Signatures Database ([MSigDB](https://www.gsea-msigdb.org/gsea/msigdb/)).
- Combine every gene from each gene set into one file. Useful for screening of genes of interest.
