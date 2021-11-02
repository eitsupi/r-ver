# editorsupports, install packages for IDE

FROM docker.io/rocker/r-ver:4.1.2@sha256:ad614f6ce7680067da674c84cf5837c451d7b40411c333e9593e307b0832cbdf AS editorsupports

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later"
COPY scripts /tmp/scripts
RUN /tmp/scripts/install_editorsupports.sh


# tidyverse, install the tidyverse packages

FROM editorsupports AS tidyverse

RUN /rocker_scripts/install_tidyverse.sh
