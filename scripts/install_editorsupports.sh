#!/bin/bash
set -e

# build ARGs
NCPUS=${NCPUS:-1}

INSTALL_RADIAN=${1:-"true"}
INSTALL_DEVTOOLS=${2:-"true"}
INSTALL_LANGUAGESERVER=${3:-"true"}
INSTALL_HTTPGD=${4:-"true"}

## The httpgd package had not be able to be installed from CRAN before R 4.0.3 release
if [ "${R_VERSION}" = "4.0.0" ] || [ "${R_VERSION}" = "4.0.1" ] || [ "${R_VERSION}" = "4.0.2" ]; then
    INSTALL_HTTPGD="false"
fi


# Package lists
## Install apt packages like install_rstudio.sh
APT_PACKAGES="file \
    git \
    libapparmor1 \
    libgc1c2 \
    libclang-dev \
    libcurl4-openssl-dev \
    libedit2 \
    libobjc4 \
    libssl-dev \
    libpq5 \
    lsb-release \
    psmisc \
    procps \
    python-setuptools \
    sudo \
    wget"
PYTHON_PACKAGES=
R_PACKAGES=

## Add radian dependencies and radian to the list
if [ "${INSTALL_RADIAN}" = "true" ]; then
    APT_PACKAGES="${APT_PACKAGES} \
        python3-pip"
    PYTHON_PACKAGES="${PYTHON_PACKAGES=} \
        radian"
fi

## Add devtools dependencies and devtools to the list
if [ "${INSTALL_DEVTOOLS}" = "true" ]; then
    APT_PACKAGES="${APT_PACKAGES} \
        libcurl4-openssl-dev \
        libxml2-dev \
        libssl-dev"
    R_PACKAGES="${R_PACKAGES=} \
        devtools"
fi

## Add languageserver dependencies and languageserver to the list
if [ "${INSTALL_LANGUAGESERVER}" = "true" ]; then
    APT_PACKAGES="${APT_PACKAGES} \
        libcurl4-openssl-dev \
        libxml2-dev \
        libssl-dev"
    R_PACKAGES="${R_PACKAGES=} \
        languageserver"
fi

## Add httpgd dependencies and httpgd to the list
if [ "${INSTALL_HTTPGD}" = "true" ]; then
    APT_PACKAGES="${APT_PACKAGES} \
        libfontconfig1-dev"
    R_PACKAGES="${R_PACKAGES=} \
        httpgd"
fi

# Install packages
## Install apt packages
if [ -n "${APT_PACKAGES}" ]; then
    apt-get update -qq && apt-get -y --no-install-recommends install $APT_PACKAGES
fi

## Install Python packages
# TODO: install radian on python pre-installed images.
if [ -n "${PYTHON_PACKAGES}" ]; then
    python3 -m pip --no-cache-dir install $PYTHON_PACKAGES
fi

## Install R packages
if [ -n "${R_PACKAGES}" ]; then
    install2.r --error --skipinstalled -r $CRAN -n $NCPUS $R_PACKAGES
fi


# Clean up
rm -rf /var/lib/apt/lists/*
rm -rf /tmp/downloaded_packages
