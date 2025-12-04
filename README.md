# Code Files
`code/table1.R`
-reads ovarian cancer incidence data from data/seer_data.csv
-groups the data by race/ethnicity
-calculates total cases and mean age-adjusted incidence rate per 100,000
-saves the summary table as a .csv file in the output/ folder

`code/figure1.R`
-reads the same data from data/seer_data.csv
-plots the age-adjusted incidence rate by year of diagnosis, separated by race/ethnicity
-saves the figure as a .png file in the output/ folder

# Report File
`final_project.Rmd`
-loads the table and figure saved by the two .R scripts
-displays the summary table and the figure in the final report
-renders the report as final_project.pdf

# Generating the Report Locally
To synchronize package repository and restore project environment, run: 
  make install
  
To build the report pdf, run: 
  make 
  
# Generating the Report on Docker 
To build the report, run: 
  docker run -v "/$(pwd)/final_report":/home/rstudio/project/final_report nush22/eric_cartman
