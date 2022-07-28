FROM rocker/shiny-verse:4.2

COPY .Renviron_github_pat root/.Renviron

RUN echo "options(repos = c(CRAN = 'https://cran.rstudio.com/'), download.file.method = 'libcurl', Ncpus = 4)" >> /usr/local/lib/R/etc/Rprofile.site
RUN R -e 'install.packages("remotes")'

RUN Rscript -e 'remotes::install_version("shiny",upgrade="never", version = "1.7.1")'
RUN Rscript -e 'remotes::install_version("config",upgrade="never", version = "0.3.1")'
RUN Rscript -e 'remotes::install_version("golem",upgrade="never", version = "0.3.1")'

RUN Rscript -e 'remotes::install_github("Thinkr-open/shinipsum")'

RUN R -e 'remotes::install_version("DT",upgrade="never", version = "0.20")'
RUN R -e 'remotes::install_version("bs4Dash",upgrade="never", version = "2.0.3")'

COPY .Renviron root/.Renviron

RUN mkdir /build_zone
ADD . /build_zone
WORKDIR /build_zone
RUN R -e 'devtools::install(dependencies = FALSE)'
RUN rm -rf /build_zone

COPY shiny-server.conf  /etc/shiny-server/shiny-server.conf
COPY app.R /srv/shiny-server/shiny_prod/
RUN rm /srv/shiny-server/index.html

EXPOSE 8080

COPY shiny-server.sh /usr/bin/shiny-server.sh

RUN ["chmod", "+x", "/usr/bin/shiny-server.sh"]
CMD ["/usr/bin/shiny-server.sh"]