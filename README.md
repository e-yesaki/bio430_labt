# READ ME FIRST bio430_labT
A repository for chemistry Laboratory T (mini project): Determination of pKa Using Spectrophotometric Speciation Analysis.

This readme file was generated on [2026-01-22] by [EMIKO YESAKI]

# GENERAL INFORMATION
## Title of Dataset

-   Lab T: Determination of pKa Using Spectrophotometric Speciation Analysis

## Author/Principal Investigator Information

Name: Emiko Yesaki, Institution: University of British Columbia
Okanagan, Email:[emiko.yesaki\@gmail.com](mailto:emiko.yesaki@gmail.com){.email}

-   Date of data collection: 2025-03-26
-   Information about funding sources that supported the collection of
    the data: N/A

# SHARING/ACCESS INFORMATION

-   Licenses/restrictions placed on the data: None; dataset intended for educational and personal use.
-   Links to publications that cite or use the data: N/A
-   Links to other publicly accessible locations of the data:
      - OSF: https://osf.io/wa9x4/overview?view_only=4af4a5616f034452946c691757cb9394

## Abstract
This project determines the pKa of an acid–base indicator using spectrophotometric measurements across a wide pH range. Absorbance at 435 nm and 593 nm was used to quantify protonated and deprotonated species, enabling construction of speciation and Henderson–Hasselbalch plots. The two analytical approaches produced pKa values of 8.78 and 8.12, respectively, demonstrating strong agreement. All raw data, processed outputs, and analysis scripts are included for reproducibility.

# DATA & FILE OVERVIEW

## File List: 

## 1. Manuscript: lab-t_draft-manuscript_2026-02-11.Rmd
-    Draft manuscript for this project.

## 2. Manuscript References: references.bib
-    Journals/articles citations used in project manuscript.

## 3. Citation style file: peerj.csl
-    Manuscript citation style.

## 4. gitignore file: .gitignore
-    A plain text file that tells Git which files/folders to ignore in this project.

## 5. Processed data script: tdata_processed_2026-02-12.R
-    Data script containing processed raw data (described below).

## Dataset Description:

## Processed Dataset Script: tdata_processed_2026-02-12.R

 This file contains data processed from data_raw_2026-01-26.csv. 

This file includes:
 -    Molar absorptivity values
 -    Measured pH values
 -    Absorbance at 435 nm and 593 nm
 -    Normalized absorbance
 -    Calculated [ln^2-] concentrations
 -    Henderson–Hasselbalch ratios and log values
 -    pKa estimates from speciation plot and Henderson–Hasselbalch plot 

# METHODOLOGICAL INFORMATION

## Description of methods used for collection/generation of raw data:

Absorbance values were collected using a laboratory spectrophotometer at:
-    435 nm (acidic form)
-    593 nm (basic form)

Samples were prepared across a wide pH range to capture both protonated and deprotonated indicator species.

## Methods for processing the data:

Performed in R using:
-    Beer–Lambert Law
-    Normalization of absorbance
-    Concentration calculations
-    Speciation curve generation
-    Henderson–Hasselbalch linearization

## Instrument- or software-specific information needed to interpret the data:

-    RStudio
-        Packages: tidyverse, ggplot2, readr, dplyr, here
-    Environment reproducibility via renv

## Citation

Recommended citation for this dataset:
Yesaki, E. (2026). Lab T Mini‑Project Dataset: Spectrophotometric Determination of pKa. UBC Okanagan.
