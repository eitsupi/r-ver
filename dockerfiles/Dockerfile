# editorsupports, install packages for IDE

FROM docker.io/rocker/r-ver:4.1.2@sha256:dcea82154fe8ee12a8c1284929cf87832f70da19c8ae50f6709d0c1b63c5dd1b AS editorsupports

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later"
COPY scripts /tmp/scripts
RUN /tmp/scripts/install_editorsupports.sh


# tidyverse, install the tidyverse packages

FROM editorsupports AS tidyverse
ENV ARROW_R_DEV=TRUE
RUN apt-get update \
    && apt-get install -y --no-install-recommends cmake \
    && rm -rf /var/lib/apt/lists/*
RUN /rocker_scripts/install_tidyverse.sh
