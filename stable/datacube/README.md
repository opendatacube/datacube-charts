# Datacube WMS [Deprecated, replaced by Datacube OWS]

[Datacube](https://www.opendatacube.org/) Web Map Service

## Example Config

This example works on docker for mac, with a pre-indexed postgres database hosted on the host machine

```yaml
image:
  registry: docker.io
  repository: opendatacube/wms
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

wms:
  config:
    url: https://raw.githubusercontent.com/GeoscienceAustralia/dea-config/master/dev/services/wms/ows/wms_cfg.py
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
    - "datacube_wms.wsgi"
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
    AWS_ACCESS_KEY_ID:
    AWS_SECRET_ACCESS_KEY:
    AWS_DEFAULT_REGION: ap-southeast-2
```

Adjust these variables for your environment

```console
$ helm install ./datacube-wms --values config.yaml
```

## Introduction

This chart bootstraps a [Datacube WMS](https://github.com/opendatacube/datacube-wms) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm install --name my-release -f config.yaml stable/datacube-wms
```

The command deploys WMS on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

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

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.