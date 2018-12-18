FROM rocker/shiny:latest

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
  libpq-dev \
  libxml2-dev \
  libssl-dev \
  libcurl4-openssl-dev

RUN install2.r -e shinydashboard \
  DBI #\
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

#COPY shinyReppuBu /srv/shiny-server/reppudashboard/
#RUN chown -R shiny /srv/shiny-server/
#RUN chown -R shiny /var/lib/shiny-server/

#Fixing user to shiny. OpenShift gives a random uid for the user
#RUN chmod ug-rw /etc/passwd
COPY fix-username.sh /fix-username.sh
COPY shiny-server.sh /usr/bin/shiny-server.sh
#RUN chmod a+rx /usr/bin/shiny-server.sh
