#!/bin/bash
set -e

UBUNTU_VERSION=${UBUNTU_VERSION:-`lsb_release -sc`}
CRAN=${CRAN:-https://cran.r-project.org}

## mechanism to force source installs if we're using RSPM
CRAN_SOURCE=${CRAN/"__linux__/$UBUNTU_VERSION/"/""}

echo 'if(R.version$arch == "aarch64") {options(repos = "'${CRAN_SOURCE}'")}' >> ${R_HOME}/etc/Rprofile.site