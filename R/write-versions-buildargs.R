#!/usr/bin/env Rscript

library(rversions)
library(jsonlite)
library(pak)
library(dplyr)
library(readr)


write_buildargs_json <- function(path, min_r_version = 4.0) {
    js <- .buildargs_list(min_r_version)
    jsonlite::write_json(js, path = path, pretty = TRUE)
}

.buildargs_list <- function(min_r_version) {
    df <- dplyr::mutate(
        dplyr::rowwise(.r_versions_data(min_r_version)),
        cran = .latest_rspm_cran_url_linux(freeze_date, ubuntu_codename)
    )[, c("version", "ubuntu_codename", "cran")]

    js <- list()
    js$include <- dplyr::rename(df, r_version = version)

    return(js)
}

.r_versions_data <- function(min_version) {
    all_data <- rversions::r_versions()
    is_ge_min_ver <- readr::parse_number(all_data$version) >= min_version
    all_data$release_date <- as.Date(all_data$date)
    all_data$freeze_date <- dplyr::lead(all_data$release_date, 1) - 1
    r_versions_data <- dplyr::mutate(
        dplyr::rowwise(all_data[is_ge_min_ver, c("version", "release_date", "freeze_date")]),
        ubuntu_codename = .latest_ubuntu_lts_series(release_date)
    )

    return(dplyr::ungroup(r_versions_data))
}

.latest_ubuntu_lts_series <- function(date) {
    ubuntu_version_data <- utils::read.csv("/usr/share/distro-info/ubuntu.csv", stringsAsFactors = FALSE)

    is_released <- as.Date(ubuntu_version_data$release) < date
    is_lts <- ubuntu_version_data$version %in% grep("LTS", ubuntu_version_data$version, value = TRUE)

    latest_lts <- utils::tail(ubuntu_version_data[is_released & is_lts, ], 1)

    return(latest_lts$series)
}

.latest_rspm_cran_url_linux <- function(date, distro_version_name) {
    n_retry_max <- 6
    if (is.na(date)) {
        url <- .make_rspm_cran_url_linux(date, distro_version_name)
        if (.is_cran_url_available(url) != TRUE) url <- NA_character_
    } else {
        dates <- seq(as.Date(date), as.Date(date) - n_retry_max, by = -1)
        for (i in seq_len(length(dates))) {
            url <- .make_rspm_cran_url_linux(dates[i], distro_version_name)
            if (.is_cran_url_available(url) == TRUE) break
            url <- NA_character_
        }
    }
    return(url)
}

.make_rspm_cran_url_linux <- function(date, distro_version_name) {
    if (is.na(date)) {
        url <- paste("https://packagemanager.rstudio.com/all/__linux__", distro_version_name, "latest", sep = "/")
    } else {
        url <- paste("https://packagemanager.rstudio.com/cran/__linux__", distro_version_name, date, sep = "/")
    }
    return(url)
}

.is_cran_url_available <- function(url) {
    repo_data <- pak::repo_ping(cran_mirror = url, bioc = FALSE)
    return(repo_data[repo_data$name == "CRAN", ]$ok)
}


write_buildargs_json("buildargs/versions.json", min_r_version = 4.0)