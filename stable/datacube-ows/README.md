# Datacube OWS

[Datacube](https://www.opendatacube.org/) Web Map Service

## Example Config

This example works on docker for mac, with a pre-indexed postgres database hosted on the host machine

```yaml
image:
  registry: docker.io
  repository: opendatacube/ows
  tag: "0.7.16"
  pullPolicy: Always
domain: localhost
database:
  host: host.docker.internal
  port: 5432
  existingSecret: ows
  database: ows
clusterInfo:
  envName: dev

environment:
  # Database Settings for datacube
  DB_HOSTNAME: export
  DB_DATABASE: ows
  DB_PASSWORD: password
  DB_PORT: 5432
  DB_USERNAME: ows

service:
  type: LoadBalancer

minReplicas: 1
maxReplicas: 2

ows:
  config:
    url: https://raw.githubusercontent.com/GeoscienceAustralia/dea-config/master/dev/services/wms/ows/ows_cfg.py
  dockerArgs:
    - "gunicorn"
    - "-b"
    - "0.0.0.0:8000"
    - "-w"
    - "2"
    - "-k"
    - "eventlet"
    - "--timeout"
    - "30"
    - "--pid"
    - "gunicorn.pid"
    - "datacube_ows.wsgi"
  enabled: true
  externalPort: 3000
  internalPort: 8000
  resources:
    requests:
      cpu: "100m"
      memory: 1536Mi
    limits:
      memory: 2560Mi
  additionalEnvironmentVars:
    AWS_NO_SIGN_REQUEST: "YES"
    AWS_DEFAULT_REGION: ap-southeast-2
    WMS_CONFIG_PATH: /env/config/ows_cfg.py
    DATACUBE_OWS_CFG: "config.ows_cfg.ows_cfg"
```

Adjust these variables for your environment

```console
$ helm install ./datacube-ows --values config.yaml
```

## Introduction

This chart bootstraps a [Datacube OWS](https://github.com/opendatacube/datacube-ows) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm install --name my-release -f config.yaml stable/datacube-ows
```

The command deploys OWS on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

### Database setup
This chart requires an exising ODC atabase.

Connecting to an existing ODC Database is done using the `database` block. A kubernetes secret containing the `postgres-username` and `postgres-password` for your database is required. This is an example block for connecting to a psql database named 'odc' on `localhost:5432`:
```YAML
database:
  database: odc
  host: localhost
  port: 5432
  existingSecret: odc-secret
```

### Using pyspy
To run py-spy as a sidecar available from chart version `0.18.10`

```YAML
    pyspy:
      image:
        registry: docker.io
        repository: mytardis/k8s-pyspy
        tag: "latest"
        pullPolicy: IfNotPresent
```

#### Running ad-hoc py-spy record
After `py-spy` and `ows` are deployment as containers in a kubernete pod,

```console
$ kubectl exec -it PODNAME -n NAMESPACE -c pyspy -- py-spy record --pid PIDNUMBER -f speedscope -o FILENAME --subprocesses
```

copy profile file from pod to local

```console
$ kubectl cp PODNAME:/FILENAME -c pyspy -n NAMESPACE ~/FILENAME
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.