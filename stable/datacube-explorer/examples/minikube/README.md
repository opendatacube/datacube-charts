# Example - Minikube / Kind / K3D

## Purpose

This is intended to be a starting point for non-production local deployments (like `Minikube`, `Kind` and `k3d`).

## Contents

- [`custom-values.yaml`](custom-values.yaml): a starting point for your values file

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
```

#### Internal postgres

```
helm install datacube-explorer-internal-db ./datacube-explorer/ --values datacube-explorer/examples/minikube/internal-db-values.yaml
```

#### external postgres

```
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install external bitnami/postgresql --set auth.database=datacube --set auth.postgresPassword=odcpass

# get secret name
kubectl get secret
# put the secret name as externalPostgresql.existingSecret value

# get host
kubectl get service
# put the service name as externalPostgresql.host value
```

```
helm install datacube-explorer-external-db ./datacube-explorer/ --values datacube-explorer/examples/minikube/external-db-values.yaml
```

## Cleanup

```
minikube stop
minikube delete
```