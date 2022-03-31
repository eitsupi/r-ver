# editorsupports, install packages for IDE

FROM docker.io/rocker/r-ver:4.1.3@sha256:01345f2188af555a61b3be4da5a8845dd00386296872b6b32d8e5d15e2398664 AS editorsupports

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
