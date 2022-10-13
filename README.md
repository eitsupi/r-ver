# Experimental Docker image build system for R

[![Docker build and push](https://github.com/eitsupi/r-ver/actions/workflows/docker-build-push.yml/badge.svg)](https://github.com/eitsupi/r-ver/actions/workflows/docker-build-push.yml)

---

**Based on the experience gained from this repository,
[rocker-org/versioned2](https://github.com/rocker-org/rocker-versioned2) and [rocker-org/devcontainer-images](https://github.com/rocker-org/devcontainer-images) have advanced onward.
Therefore, this repository is no longer maintained.**

---

This project is based on [rocker-org/versioned2](https://github.com/rocker-org/rocker-versioned2).

Since RStudio Server is currently only available for amd64, build amd64/arm64 multi-arch image `ghcr.io/eitsupi/r-ver/editorsupports` with [the languageserver package](https://github.com/REditorSupport/languageserver), etc. installed instead of RStudio in `rocker/rstudio`.

In addition, images with the tidyverse package already installed (like `rocker/tidyverse`) can be pulled as follows.

```shell
$ docker pull ghcr.io/eitsupi/r-ver/tidyverse:latest
```

See [the Dockerfile](./dockerfiles/Dockerfile) for details.

## Targets

- [x] Multi CPU architecture images.
- [x] Scheduled build.
- [x] Various annotations.
- [ ] Automatic test.
- [x] Automatic update.(Pull Request)

## License

GPL-2.0-or-later
