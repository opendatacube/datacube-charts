# Datacube WMS

[Datacube](https://www.opendatacube.org/) Index Generation Job Template

## Example Config

This example works on docker for mac, with a pre-indexed postgres database hosted on the host machine

```yaml
# Example YAML configuration for running an index job on a k8s datacube using
# YAML files in S3
index:
  # Change the name of the job here
  # Cannot have 2 jobs with the same name
  jobname: geomedian-test-index
  # S3 bucket where YAML files
  bucket: dea-public-data
  # List of product URLs that will be added to the datacube
  # optional
  products: 
    - https://raw.githubusercontent.com/GeoscienceAustralia/dea-config/master/dev/products/geomedian-au/geomedian_nbart_annual.yaml
  # List of S3 prefixes to search for datasets
  prefix:
    - geomedian-australia/v2.1.0/
  # suffix of datasets. While this can be anything the index job currently only supports YAML files
  suffix: .yaml
  # Additional Environment Variables to pass to the index container
  additionalEnvironmentVars:
    AWS_METADATA_SERVICE_TIMEOUT: 60
    AWS_METADATA_SERVICE_NUM_ATTEMPTS: 30
  # Configuration URL for the WMS
  wmsConfigURL: "https://raw.githubusercontent.com/GeoscienceAustralia/dea-config/master/dev/services/wms/ows/wms_cfg.py"
global:
  image:
    repository: opendatacube/wms
    tag: "latest"
  externalDatabase:
    database: ows
    port: 5432
    # Hostname of the Database as accessible from the k8s cluster
    host: host.docker.internal
```

Adjust these variables for your environment

```console
$ helm fetch --untar datacube-charts/datacube-index
$ helm template datacube-index -x templates/index.yaml -f $template -f $name | kubectl create -f -
rm -r datacube-index
```

## Introduction

This chart creates a [Kubernetes](http://kubernetes.io) job to generate a [Datacube](https://github.com/opendatacube/datacube-core) index on a postgres database using a cluster using the [Helm](https://helm.sh) package manager.

This chart will read Datacube metadata files from AWS S3, and index them into a postgres database.

## Installing the Chart

To install the chart with the release name `my-release`:

```console
$ helm install --name my-release -f config.yaml stable/datacube-wms 
```

The command deploys the job on the Kubernetes cluster in the default namespace. 

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```console
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Indexing multiple folders at once
Using a small bash command and YAML config file can be used so that multiple index jobs can be created at once. For example to index WOFLs create a YAML configuration replacing the `database` section with the appropriate database information and the `annotations` section with the appropriate AWS IAM role (generally the same role used for a datacube WMS / WCS):
```YAML
image:
  registry: docker.io
  tag: latest
  repository: opendatacube/datacube-index
  pullPolicy: IfNotPresent
database:
  database: ows
  host: database.hostname.com
  username: ows
  existingSecret: ows
datacube:
  configPath: /opt/odc/datacube.conf
index:
  additionalEnvironmentVars:
    AWS_DEFAULT_REGION: ap-southeast-2
  annotations:
    iam.amazonaws.com/role: kube2iam_iam_role
  resources:
    requests:
      cpu: 300m
      memory: 768Mi
    limits:
      cpu: 500m
      memory: 2Gi
```
then run the following (will use `datacube-index` version `0.4.0`):
```console
aws s3 ls s3://dea-public-data/WOfS/WOFLs/v2.1.5/combined/ | grep PRE | awk '{print $2}' | tr -d x | tr -d _ | tr -d / | xargs -n 1 -I {} helm upgrade --install --wait wofls-{} "https://opendatacube.github.io/datacube-charts/charts/datacube-index-0.4.0.tgz" -f ows_index.yaml --set index.dockerArgs[2]="s3-find s3://dea-public-data/WOfS/WOFLs/v2.1.5/combined/x_{}/**/*.yaml | s3-to-tar | dc-index-from-tar"
```
