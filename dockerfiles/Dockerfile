# editorsupports, install packages for IDE

FROM docker.io/rocker/r-ver:4.2.0@sha256:b80aa63cef43c6db193614883f4230822272a1a58dc9c0a5b91b60ad46975bbe AS editorsupports

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
