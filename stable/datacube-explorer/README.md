# datacube-explorer

![Version: 0.5.31](https://img.shields.io/badge/Version-0.5.29-informational?style=flat-square)

A Helm chart for Datacube Explorer

**Homepage:** <https://www.opendatacube.org/documentation>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| DEA Teams | <deacloudteam@ga.gov.au> |  |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalEnvironmentVars | object | `{}` |  |
| additionalSettings | object | `{}` |  |
| affinity | object | `{}` |  |
| annotations | object | `{}` |  |
| database.database | string | `"datacube"` |  |
| database.existingSecret | string | `"explorer-reader"` |  |
| database.host | string | `"localhost"` |  |
| database.port | int | `5432` |  |
| dockerArgs[0] | string | `"gunicorn"` |  |
| dockerArgs[10] | string | `"--pid"` |  |
| dockerArgs[11] | string | `"gunicorn.pid"` |  |
| dockerArgs[12] | string | `"--worker-tmp-dir"` |  |
| dockerArgs[13] | string | `"/dev/shm"` |  |
| dockerArgs[14] | string | `"--preload"` |  |
| dockerArgs[15] | string | `"--config"` |  |
| dockerArgs[16] | string | `"python:cubedash.gunicorn_config"` |  |
| dockerArgs[17] | string | `"cubedash:app"` |  |
| dockerArgs[18] | string | `"||"` |  |
| dockerArgs[19] | string | `"true"` |  |
| dockerArgs[1] | string | `"-b"` |  |
| dockerArgs[2] | string | `"0.0.0.0:8080"` |  |
| dockerArgs[3] | string | `"-w"` |  |
| dockerArgs[4] | string | `"3"` |  |
| dockerArgs[5] | string | `"--threads=2"` |  |
| dockerArgs[6] | string | `"-k"` |  |
| dockerArgs[7] | string | `"gthread"` |  |
| dockerArgs[8] | string | `"-t"` |  |
| dockerArgs[9] | string | `"60"` |  |
| externalPort | int | `80` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"opendatacube/explorer"` |  |
| image.tag | string | `"latest"` |  |
| ingress.ingressClassName | string | `""` |  | 
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0] | string | `""` |  |
| ingress.path | string | `"/"` |  |
| internalPort | int | `8080` |  |
| livenessProbe.failureThreshold | int | `5` |  |
| livenessProbe.httpGet.path | string | `"/stac"` |  |
| livenessProbe.httpGet.port | int | `8080` |  |
| livenessProbe.initialDelaySeconds | int | `10` |  |
| livenessProbe.periodSeconds | int | `30` |  |
| livenessProbe.timeoutSeconds | int | `60` |  |
| readinessProbe.failureThreshold | int | `5` |  |
| readinessProbe.httpGet.path | string | `"/stac"` |  |
| readinessProbe.httpGet.port | int | `8080` |  |
| readinessProbe.initialDelaySeconds | int | `10` |  |
| readinessProbe.periodSeconds | int | `30` |  |
| readinessProbe.timeoutSeconds | int | `60` |  |
| replicaCount | int | `1` |  |
| resources.limits.cpu | string | `"300m"` |  |
| resources.limits.memory | string | `"1024Mi"` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccountName | string | `nil` |  |
| startupProbe.failureThreshold | int | `5` |  |
| startupProbe.httpGet.path | string | `"/stac"` |  |
| startupProbe.httpGet.port | int | `8080` |  |
| startupProbe.initialDelaySeconds | int | `10` |  |
| startupProbe.periodSeconds | int | `30` |  |
| startupProbe.timeoutSeconds | int | `60` |  |
| updateCreationDt.backoffLimit | int | `0` |  |
| updateCreationDt.concurrencyPolicy | string | `"Allow"` |  |
| updateCreationDt.cron | string | `"0 13 * * *"` |  |
| updateCreationDt.dockerArgs[0] | string | `"cubedash-gen"` |  |
| updateCreationDt.dockerArgs[1] | string | `"--no-init-database"` |  |
| updateCreationDt.dockerArgs[2] | string | `"--refresh-stats"` |  |
| updateCreationDt.dockerArgs[3] | string | `"--force-refresh"` |  |
| updateCreationDt.dockerArgs[4] | string | `"--all"` |  |
| updateCreationDt.enabled | bool | `false` |  |
| updateCreationDt.historyLimit | int | `1` |  |
| updateCreationDt.suspend | bool | `false` |  |

