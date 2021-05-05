#!/bin/bash
set -e

echo 'if(R.version$arch == "aarch64") {options(repos = "https://packagemanager.rstudio.com/all/latest")}' >> ${R_HOME}/etc/Rprofile.site