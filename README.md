# Datacube Helm Charts

![Linting](https://github.com/opendatacube/datacube-charts/workflows/Linting/badge.svg)
![Publish charts](https://github.com/opendatacube/datacube-charts/workflows/Publish%20charts/badge.svg)

This repository hosts the Opendatacube Helm charts


You can use these helm charts in your own kubernetes cluster by adding the helm chart repo 

`helm repo add datacube-charts https://opendatacube.github.io/datacube-charts/charts/`

Documentation for installing each chart is available in their own directories

## CI  Lint
to pass lint and for each value change, please run `.github/helm-docs.sh` and this script will update the doc.
