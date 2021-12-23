# editorsupports, install packages for IDE

FROM docker.io/rocker/r-ver:4.1.2@sha256:4f0d91faf933de445211aea823aadcec15cd4c0d7bfaa8654731546827284d67 AS editorsupports

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
