datacube-explorer
=================
A Helm chart for Datacube Explorer

Current chart version is `0.5.27`

Source code can be found [here](https://www.opendatacube.org/documentation)



## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalEnvironmentVars | object | `{}` |  |
| additionalSettings | object | `{}` |  |
| affinity | object | `{}` |  |
| annotations | object | `{}` |  |
| containerPort | int | `8080` |  |
| database.database | string | `"datacube"` |  |
| database.existingSecret | string | `""` |  |
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
| image.pullPolicy | string | `"Always"` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"opendatacube/explorer"` |  |
| image.tag | string | `"latest"` |  |
| ingress.annotations."kubernetes.io/ingress.class" | string | `"alb"` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0] | string | `""` |  |
| ingress.path | string | `"/*"` |  |
| livenessProbe | object | `{}` |  |
| readinessProbe | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources.limits.cpu | string | `"300m"` |  |
| resources.limits.memory | string | `"1024Mi"` |  |
| service.port | int | `80` |  |
| service.type | string | `"NodePort"` |  |
| serviceAccountName | string | `nil` |  |
| startupProbe | object | `{}` |  |
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
