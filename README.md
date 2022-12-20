# Datacube Helm Charts

![Linting](https://github.com/opendatacube/datacube-charts/workflows/Linting/badge.svg)
![Publish charts](https://github.com/opendatacube/datacube-charts/workflows/Publish%20charts/badge.svg)

This repository hosts the Opendatacube Helm charts


You can use these helm charts in your own kubernetes cluster by adding the helm chart repo

`helm repo add datacube-charts https://opendatacube.github.io/datacube-charts/charts/`

Documentation for installing each chart is available in their own directories

## CI  Lint
to pass lint and for each value change, please run `.github/helm-doc.sh` and this script will update the doc.


## Chart testing

### install Minikube

```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube start
```

### Install helm

```
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```

### Install charts

```
cd datacube-charts/stable
helm install datacube-explorer-local ./datacube-explorer/ --values datacube-explorer/values.yaml
```