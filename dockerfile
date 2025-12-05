FROM rocker/tidyverse:4.5.1 as base

RUN mkdir /home/rstudio/project
WORKDIR /home/rstudio/project

RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.cache


RUN Rscript -e "renv::restore(prompt = FALSE)"

FROM rocker/tidyverse:4.5.1

RUN mkdir /home/rstudio/project

WORKDIR /home/rstudio/project
COPY --from=base /home/rstudio/project .

ENV WHICH_CONFIG=default

RUN mkdir code 
RUN mkdir output
RUN mkdir data 
RUN mkdir report 

COPY final_project.Rmd final_project.Rmd
COPY data/ data/
COPY code/ code/
COPY Makefile Makefile

RUN Rscript -e "tinytex::install_tinytex()"
ENV PATH="${PATH}:/root/bin"

ENTRYPOINT ["sh", "-c", "make final_project.pdf && cp final_project.pdf report/"]