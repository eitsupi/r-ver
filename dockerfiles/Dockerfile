# editorsupports, install packages for IDE

FROM docker.io/rocker/r-ver:4.2.0@sha256:da7d4b792fa9609e3b6819339d8c5a47247a903d876d82f1b4273ace37cc0677 AS editorsupports

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
