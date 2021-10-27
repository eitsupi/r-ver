# editorsupports, install packages for IDE

FROM docker.io/rocker/r-ver:4.1.1@sha256:e7382b3724417f4630bdd1770e9e3446bcf6b83ea5e40fc36f859e4e13a7d9d9 AS editorsupports

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later"
COPY scripts /tmp/scripts
RUN /tmp/scripts/install_editorsupports.sh


# tidyverse, install the tidyverse packages

FROM editorsupports AS tidyverse

RUN /rocker_scripts/install_tidyverse.sh
