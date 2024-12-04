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
The GJP Dataverse can be accessed by: https://dataverse.harvard.edu/dataverse/gjp
Using these data files (`survey_fcasts.yr1.csv`, `survey_fcasts.yr2.csv` and `ifps.csv`) from GJP Dataverse, we create the data set for our analyses using the `Data Processing.R`.
The resulting data (which is used for the analyses) can be found in the **Data** folder.
Figures 1, 3, and 4 were produced using the `Figure1,3,4.xlsx` Excel file. 
Figure 2 was produced using the `Figure2script.R` R script. 
Tables 1 and 2 were produced using `Table1script.R` Rscript and `Table2STATAscript.do`STATA Code. 



## Instructions & computational requirements

All file paths are relative to the root of the replication package. Please set your working directory accordingly using RStudio.
These analyses were run on R 4.2.2, and we explicitly use the following packages in the analysis files: `ggplot2` (3.4.0), `dplyr` (1.0.10), `readr` (2.1.3).
The analyses were conducted on multiple systems to ensure reproducibility. Two of these results are uploaded under the Tables folder. The configuration of the two systems that produced these results are as follows:

**System 1:**
- **Operating System**: Microsoft Windows 10 Pro, Version 10.0.19045 Build 19045  
- **Processor**: Intel(R) Core(TM) i7-6820HQ CPU @ 2.70GHz, 2712 Mhz, 4 Core(s), 8 Logical Processor(s)  
- **Memory**: 32 GB RAM  
- **System Type**: x64-based PC  
- **Platform**: Microsoft Surface Studio  

**System 2:**
- **Operating System**: macOS Ventura (macOS 13.4 or later)  
- **Model**: Mac Mini (Mac14,12)  
- **Chip**: Apple M2 Pro  
- **Processor Cores**: 10 cores (6 performance and 4 efficiency cores)  
- **Memory**: 16 GB RAM  
- **System Firmware Version**: 10151.121.1  



## References
[dataset] Good Judgment Project Dataverse. Tetlock et al., (last accessed on October 30th, 2023), https://dataverse.harvard.edu/dataverse/gjp