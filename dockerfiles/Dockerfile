# editorsupports, install packages for IDE

FROM docker.io/rocker/r-ver:4.1.1@sha256:2d9135384e0eb1384adcf3f1c7aa8d39eecbe544cb9074b1735a581aa639a0ad AS editorsupports

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later"
COPY scripts /tmp/scripts
RUN /tmp/scripts/install_editorsupports.sh


# tidyverse, install the tidyverse packages

FROM editorsupports AS tidyverse

RUN /rocker_scripts/install_tidyverse.sh
