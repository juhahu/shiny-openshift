FROM rocker/shiny:latest
LABEL maintainer="Juha Hulkkonen <juha.hulkkonen@csc.fi>"

RUN apt-get update
RUN apt-get install -y --no-install-recommends \
  libpq-dev \
  libxml2-dev \
  libssl-dev \
  libcurl4-openssl-dev \
  nano

RUN install2.r -e shinydashboard \
 DBI \
 RPostgreSQL \
 jsonlite \
 dplyr \
 magrittr \
 dbplyr \
 stringr \
 tidyr \
 DT \
 ggplot2 \
 shinyjs \
 scales \
 plotly \
 shinyBS \
 lubridate \
 shinyWidgets


COPY shiny-server.conf /etc/shiny-server/shiny-server.conf
RUN chown -R shiny /srv/shiny-server/
RUN chown -R shiny /var/lib/shiny-server/

# OpenShift gives a random uid for the user and some programs try to find a username from the /etc/passwd.
# Let user to fix it, but obviously this shouldn't be run outside OpenShift
RUN chmod ug+rw /etc/passwd 
COPY fix-username.sh /fix-username.sh
COPY shiny-server.sh /usr/bin/shiny-server.sh
RUN chmod a+rx /usr/bin/shiny-server.sh


# Make sure the directory for individual app logs exists and is usable
RUN chmod -R a+rwX /var/log/shiny-server
RUN chmod -R a+rwX /var/lib/shiny-server
