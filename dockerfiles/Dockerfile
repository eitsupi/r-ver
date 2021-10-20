# editorsupports, install packages for IDE

FROM docker.io/rocker/r-ver:4.1.1@sha256:7ff079e36f129aa39f83a42ebaf6c0da040dcc10d7334b632d3127ccf80bfb73 AS editorsupports

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later"
COPY scripts /tmp/scripts
RUN /tmp/scripts/install_editorsupports.sh


# tidyverse, install the tidyverse packages

FROM editorsupports AS tidyverse

RUN /rocker_scripts/install_tidyverse.sh
