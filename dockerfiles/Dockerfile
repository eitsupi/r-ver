# editorsupports, install packages for IDE

FROM docker.io/rocker/r-ver:4.1.2@sha256:30e0ddb2860dff0e82b941c5f63ca727733c2cbb4a41a0f975feb31c45629a21 AS editorsupports

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later"
COPY scripts /tmp/scripts
RUN /tmp/scripts/install_editorsupports.sh


# tidyverse, install the tidyverse packages

FROM editorsupports AS tidyverse

RUN /rocker_scripts/install_tidyverse.sh
