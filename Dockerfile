FROM rocker/shiny:latest

RUN apt-get install -y --no-install-recommends \
  libpq-dev \
  libxml2-dev \
  libssl-dev \
  libcurl4-openssl-dev

RUN install2.r -e shinydashboard \
# DBI \
# RPostgreSQL \
# jsonlite \
# dplyr \
# magrittr \
# dbplyr \
# stringr \
# tidyr \
# DT \
# ggplot2 \
# shinyjs \
# scales \
# plotly \
# shinyBS \
# lubridate \
# shinyWidgets 

COPY shinyReppuBu /srv/shiny-server/reppudashboard/
RUN chown -R shiny /srv/shiny-server/
RUN chown -R shiny /var/lib/shiny-server/

#testikommentti dev-docker
