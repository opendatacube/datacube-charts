# datacube-processing

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![AppVersion: 1.0](https://img.shields.io/badge/AppVersion-1.0-informational?style=flat-square)

A Helm chart for datacube processing

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| annotations."iam.amazonaws.com/role" | string | `"kubernetes-pipelines"` |  |
| cron.concurrencyPolicy | string | `"Allow"` |  |
| cron.historyLimit | int | `1` |  |
| cron.schedule | string | `"*/5 * * * *"` |  |
| cron.suspend | bool | `false` |  |
| database.database | string | `"ows"` |  |
| database.existingSecret | string | `"datacube"` |  |
| database.host | string | `"db-dev-eks-datacube-default.cxhoeczwhtar.ap-southeast-2.rds.amazonaws.com"` |  |
| database.port | int | `5432` |  |
| image.imagePullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"opendatacube/pipelines"` |  |
| image.tag | string | `"wofs-1.22"` |  |
| job.filePrefix | string | `"S2_WATER_3577"` |  |
| job.inputS3Bucket | string | `"dea-public-data"` |  |
| job.jobsPerWorker | int | `1` |  |
| job.maxTime | int | `300` |  |
| job.outputPath | string | `"WOfS/WOFLs/v2.1.6/combined"` |  |
| job.outputS3Bucket | string | `"dea-public-data-dev"` |  |
| logLevel | string | `"INFO"` |  |
| nodeSelector | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources.limits.cpu | string | `"1000m"` |  |
| resources.limits.memory | string | `"16Gi"` |  |
| resources.requests.cpu | string | `"400m"` |  |
| resources.requests.memory | string | `"1Gi"` |  |
| sqs.messagePrefix | string | `"L2/sentinel-2-nrt/S2MSIARD/*/*/ARD-METADATA.yaml"` |  |
| sqs.pollTimeSec | int | `2` |  |
| sqs.queue | string | `"wofs"` |  |
| sqs.region | string | `"ap-southeast-2"` |  |
| tolerations | list | `[]` |  |

