cd /project

Rscript -e 'deps <- devtools::dev_package_deps(dependencies = NA);devtools::install_deps(dependencies = TRUE);if (!all(deps$package %in% installed.packages())) { message("missing: ", paste(setdiff(deps$package, installed.packages()), collapse=", ")); q(status = 1, save = "no")}'

R CMD build  .

R CMD check "${PKG_TARBALL}" --as-cran --no-manual --no-manual --no-manual --no-manual; CHECK_RET=$?

Rscript -e 'covr::codecov()'
