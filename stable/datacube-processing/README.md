# Datacube Processing

[Datacube](https://www.opendatacube.org/) Processing Pipeline

## About

When new data is loaded into the S3 bucket an item is logged into your SQS Queue, 
Every few minutes (configurable) a CronJob will check the queue, If it has messages, they will be filtered and processed. A Job will keep running until the queue is empty or it fails. If the SQS Queue has lots of messages eventually the Cron Job will add more Jobs to process them faster. When the Queue is empty all Jobs will complete.
If a Job fails, it will be returned to the queue after (job.maxJobTime) is passed, so other workers can process it.


## Example Config

This example works on docker for mac, with a pre-indexed postgres database hosted on the host machine

```yaml

```

Adjust these variables for your environment

```console
$ helm install ./datacube-wms --values config.yaml
```

## Introduction

This chart creates a [Datacube WMS](https://github.com/opendatacube/datacube-wms) processing worker pool on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.




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
