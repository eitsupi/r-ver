FROM alpine/git AS source

WORKDIR /tmp
RUN git clone https://github.com/rocker-org/rocker-versioned2.git


ARG R_VERSION=4.0.5
ARG CRAN=https://packagemanager.rstudio.com/all/__linux__/focal/latest

FROM ubuntu:20.04

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later"

ENV R_VERSION=${R_VERSION}
ENV TERM=xterm
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV R_HOME=/usr/local/lib/R
ENV CRAN=${CRAN}
ENV TZ=Etc/UTC

COPY --from=source /tmp/rocker-versioned2/scripts /rocker_scripts

RUN /rocker_scripts/install_R.sh

CMD ["R"]
