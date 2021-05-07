#!/bin/bash
set -e

UBUNTU_VERSION=${UBUNTU_VERSION:-`lsb_release -sc`}
CRAN=${CRAN:-https://cran.r-project.org}

## mechanism to force source installs if we're using RSPM
if [ "$(uname -m)" = "aarch64" ]; then
    export CRAN=${CRAN/"__linux__/$UBUNTU_VERSION/"/""}
fi

exec "$@"
