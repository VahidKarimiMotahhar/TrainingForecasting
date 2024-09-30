# Replication package for "How does training improve individual forecasts? Modeling Differences in Compensatory and Non-Compensatory Biases in Geopolitical Forecasts"

Vahid Karimi Motahhar and Thomas S. Gruca

Corresponding author’s contact details: vahid.karimimotahhar@sabanciuniv.edu

## Overview & contents

This repository contains the code and data for the analysis presented in our manuscript. 
The code in this replication material uses 3 downloaded raw data sets and necessary codes to produce our data set for analyses, and to generate figures and tables.

The main contents of the repository are the following:

- **Data**: Contains the cleaned dataset `ReCod.xlsx` used in the analysis.
- **Figures**: Contains Figures 1, 2, 3, and 4 as PDF files.
- **Tables**: Contains Tables 1 and 2 as PDF files.

## Scripts

- `Data Processing.R`: Processes raw data into a format suitable for analysis.
- `Figure1,3,4.xlsx`: An Excel file with sheets that generate Figures 1, 3, and 4 of the manuscript.
- `Figure2script.R`: Generates Figure 2 for the manuscript.
- `Table1script.R`: Produces the data for Table 1.
- `Table2STATAscript.do`: STATA script that produces results for Table 2.


## Instructions
Please download the 3 raw data files from Good Judgment (GJP) Project Dataverse, Tetlock et al., (last accessed on October 30th, 2023).
We will use the raw data files `survey_fcasts.yr1.csv`, `survey_fcasts.yr2.csv` and `ifps.csv` from GJP Dataverse
The GJP Dataverse can be accessed by: https://dataverse.harvard.edu/dataverse/gjp .
Using these data files (`survey_fcasts.yr1.csv`, `survey_fcasts.yr2.csv` and `ifps.csv`) from GJP Dataverse, we create the data set for our analyses using the `Data Processing.R`.
The resulting data (which is used for the analyses) can be found in the **Data** folder.
Figures 1, 3, and 4 were produced using the `Figure1,3,4.xlsx` Excel file. 
Figure 2 was produced using the `Figure2script.R` R script. 
Tables 1 and 2 were produced using `Table1script.R` Rscript and `Table2STATAscript.do`STATA Code. The `Table 2 Results on 6092024.pdf`contains example of our models' results. 
This GitHub repository was assembled on September 30th 2024. The Results provided in Table 2 was produced on June 29th 2024. More specifications on computational environment can be found in the `Table2STATAscript.do`.


## Computational instructions

All file paths are relative to the root of the replication package. Please set your working directory accordingly using RStudio.

These analyses were run on STATA 18 SE, and R 4.2.2. We explicitly use the following R packages in the analysis files: `ggplot2` (3.4.0), `dplyr` (1.0.10), `readr` (2.1.3).


## References
[dataset] Good Judgment Project Dataverse. Tetlock et al., (last accessed on October 30th, 2023), https://dataverse.harvard.edu/dataverse/gjp
