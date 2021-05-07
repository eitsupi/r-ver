# source, copy scripts from rocker-org/rocker-versioned2 repository

FROM alpine/git AS source

WORKDIR /tmp
RUN git clone https://github.com/rocker-org/rocker-versioned2.git


# builder, install R

FROM ubuntu:20.04 AS builder

ARG VARIANT=devel
ARG CRAN_URL=https://cloud.r-project.org

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later"

ENV R_VERSION=${VARIANT}
ENV TERM=xterm
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV R_HOME=/usr/local/lib/R
ENV CRAN=${CRAN_URL}
ENV TZ=Etc/UTC

COPY --from=source /tmp/rocker-versioned2/scripts/install_R.sh /rocker_scripts/install_R.sh

RUN /rocker_scripts/install_R.sh

CMD ["R"]


# r-ver, compatible with rocker/r-ver

FROM builder AS r-ver

COPY --from=source /tmp/rocker-versioned2/scripts/ /rocker_scripts/
COPY scripts /tmp/scripts

RUN /tmp/scripts/fix_cran_arm.sh
