# Datacube WMS

[Datacube](https://www.opendatacube.org/) Web Map Service

## Example Config

This example works on docker for mac, with a pre-indexed postgres database hosted on the host machine

```yaml
global:
  image:
    registry: docker.io
    repository: opendatacube/wms
    tag: "0.7.16"
    pullPolicy: Always
  datacube:
    wpsConfigURL: https://raw.githubusercontent.com/GeoscienceAustralia/dea-config/master/dev/services/wps/combined/pywps.cfg
    products: 
      - https://raw.githubusercontent.com/GeoscienceAustralia/dea-config/master/dev/products/wofs/wofs_filtered_summary.yaml
      - https://raw.githubusercontent.com/GeoscienceAustralia/dea-config/master/dev/products/ls8-bare-earth/landsat8_barest_earth_albers.yaml
  domain: localhost
  clusterSecret: ows
  externalDatabase:
    host: host.docker.internal
    port: 5432
    credsFromSecret: ows
    imageTag: setup-k
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
loadBalancerAddress: localhost

minReplicas: 1
maxReplicas: 2

index:
  enabled: true
data_orchestration:
  enabled: false

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

datacube-index:
  index:
    bucket: dea-public-data
    prefix:
      - WOfS/filtered_summary/v2.1.0/combined/
      - bare-earth/summary/v2.1.1/
    suffix: .yaml
    additionalEnvironmentVars:
      AWS_METADATA_SERVICE_TIMEOUT: 60
      AWS_METADATA_SERVICE_NUM_ATTEMPTS: 30
      AWS_ACCESS_KEY_ID:  
      AWS_SECRET_ACCESS_KEY: 
      AWS_DEFAULT_REGION: ap-southeast-2
    wmsConfigURL: "https://raw.githubusercontent.com/GeoscienceAustralia/dea-config/master/dev/services/index/ows/wms_cfg.py"
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

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release. It will also remove the database as part of the installation.
