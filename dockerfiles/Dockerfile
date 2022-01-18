# editorsupports, install packages for IDE

FROM docker.io/rocker/r-ver:4.1.2@sha256:e08426e88013ad42aebe03feeb7995d12f78d52b998b001618dba1013de5df1b AS editorsupports

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
