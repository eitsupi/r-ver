FROM alpine/git AS source

WORKDIR /tmp
RUN git clone https://github.com/rocker-org/rocker-versioned2.git


FROM ubuntu:20.04

ARG VARIANT=4.0.5
ARG CRAN_URL=https://packagemanager.rstudio.com/all/__linux__/focal/latest

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later"

ENV R_VERSION=${VARIANT}
ENV TERM=xterm
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV R_HOME=/usr/local/lib/R
ENV CRAN=${CRAN_URL}
ENV TZ=Etc/UTC

COPY --from=source /tmp/rocker-versioned2/scripts /rocker_scripts

RUN /rocker_scripts/install_R.sh

CMD ["R"]
