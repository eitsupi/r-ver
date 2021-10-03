# editorsupports, install packages for IDE

FROM docker.io/rocker/r-ver:4.1.1@sha256:401ca93dddc647f74d26e10cddfdff2ed680a03be53421a4cfdcd9e805183b57 AS editorsupports

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later"
COPY scripts /tmp/scripts
RUN /tmp/scripts/install_editorsupports.sh


# tidyverse, install the tidyverse packages

FROM editorsupports AS tidyverse

RUN /rocker_scripts/install_tidyverse.sh
