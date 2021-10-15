# editorsupports, install packages for IDE

FROM docker.io/rocker/r-ver:4.1.1@sha256:13179ebff556edfd3b8dc08173dfcd3e055a16008ae02f30fcc0ac304af4d817 AS editorsupports

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later"
COPY scripts /tmp/scripts
RUN /tmp/scripts/install_editorsupports.sh


# tidyverse, install the tidyverse packages

FROM editorsupports AS tidyverse

RUN /rocker_scripts/install_tidyverse.sh
