FROM alpine/git AS sauce

WORKDIR /tmp
RUN git clone https://github.com/eitsupi/rocker-versioned2.git
WORKDIR /tmp/rocker-versioned2
RUN git checkout 9ee987b58956b51e0a7ca7965a579f0f305fb6ab


FROM ubuntu:18.04

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later"

ENV R_VERSION=4.0.5
ENV TERM=xterm
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV R_HOME=/usr/lib/R
ENV CRAN=https://packagemanager.rstudio.com/all/__linux__/bionic/latest
ENV TZ=Etc/UTC

COPY --from=sauce /tmp/rocker-versioned2/scripts /rocker_scripts

RUN /rocker_scripts/install_R_ppa.sh

CMD ["R"]