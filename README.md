# **GSEAsh**

## Overview

These scripts offer various functionalities for running GSEA, obtaining database metadata, and processing results. The initial version includes the following features:

- **Memory Management**: Automatically adjusts to the user's memory capacity, enabling simultaneous GSEA analysis for multiple comparisons. Adapted from the [GSEA User Guide](https://docs.gsea-msigdb.org/#).
- **Gene Set Consistency Check**: Verifies that all analyses use the same gene sets and quantities.
- **Results Merging**: Combines GSEA result TSV files from different comparisons into a single file.
- **Gene Set Retrieval**: Downloads GRP files for selected gene sets from the [Molecular Signatures Database (MSigDB)](https://www.gsea-msigdb.org/gsea/msigdb/).
- **Gene Consolidation**: Generates a data frame with genes in one column and their source gene sets in another, facilitating gene tracking and screening.
