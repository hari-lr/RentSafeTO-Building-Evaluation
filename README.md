# RentSafeTO-Building-Evaluation
Overview
This repo consists a data analysis project associated with Telling Stories with Data. This paper analyzes possible demographic and physical factors of the current Apartment Building Evaluations in Toronto. Specifically, the report speculates the relationship between ward income and year of construction with the building evaluation scores. 

# File Structure
The repo is structured as:
**input/data** contains the data sources used in analysis including the raw data.
**outputs/data** contains the cleaned dataset that was constructed.
**outputs/paper** contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper.
**scripts** contains the R scripts used to simulate, download and clean data.

# How to Run
Run scripts/01-download_data.R to download raw data
Run scripts/02-data_cleaning.R to generate cleaned data
Run outputs/paper/MHA_study.qmd to generate the PDF of the paper
Statement on LLM usage
LLMs were used for some aspects of the code, particularly in the data clean script (02_clean_data.R) and the final paper (paper.qmd). The LLM used was ChatGPT. Receipts are available in the folder inputs. 

