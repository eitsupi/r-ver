# editorsupports, install packages for IDE

FROM docker.io/rocker/r-ver:4.1.1@sha256:221eb5d7359b5cc821019da9019ff44eefdbc370d459ea00a9572a99c6944621 AS editorsupports

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later"
COPY scripts /tmp/scripts
RUN /tmp/scripts/install_editorsupports.sh


# tidyverse, install the tidyverse packages

FROM editorsupports AS tidyverse

RUN /rocker_scripts/install_tidyverse.sh
