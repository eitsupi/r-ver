# editorsupports, install packages for IDE

FROM docker.io/rocker/r-ver:4.1.1@sha256:ceedfa3cd31f9a1d1eaa8151f4ebf571c5d5681024d9562a16aa1b23f98a1747 AS editorsupports

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later"
COPY scripts /tmp/scripts
RUN /tmp/scripts/install_editorsupports.sh


# tidyverse, install the tidyverse packages

FROM editorsupports AS tidyverse

RUN /rocker_scripts/install_tidyverse.sh
