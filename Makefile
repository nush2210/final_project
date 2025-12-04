#! Build entire report 
all: final_project.pdf

#! Install package environment with renv
.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"

#! Build the final report (PDF)
final_project.pdf: final_project.Rmd output/table1.csv output/figure1.png
	Rscript -e "rmarkdown::render('final_project.Rmd', output_file='final_project.pdf')"

#! Rule to create the output table
output/table1.csv: code/table1.R data/seer_data.csv
	Rscript code/table1.R

#! Rule to create the output figure
output/figure1.png: code/figure1.R data/seer_data.csv
	Rscript code/figure1.R

#! Clean up all generated outputs
.PHONY: clean
clean:
	rm -f output/*.csv output/*.png report/*.pdf
	
#! Run Docker to generate the report 
.PHONY: docker
docker:
	docker run -v "/$$(pwd)/final_report":/home/rstudio/project/final_report nush22/eric_cartman