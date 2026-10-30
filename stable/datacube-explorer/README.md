# datacube-explorer

![Version: 0.11.2](https://img.shields.io/badge/Version-0.11.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 3.2.1](https://img.shields.io/badge/AppVersion-3.2.1-informational?style=flat-square)

A Helm chart for Datacube Explorer

**Homepage:** <https://www.opendatacube.org/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| omad |  |  |
| pjonsson |  |  |

## Source Code

* <https://github.com/opendatacube/datacube-explorer>
* <https://github.com/opendatacube/datacube-charts>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalEnvironmentVars | object | `{}` |  |
| additionalSettings | string | `""` |  |
| affinity | object | `{}` |  |
| annotations | object | `{}` |  |
| containerSecurityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"seccompProfile":{"type":"RuntimeDefault"}}` | The SecurityContext for Explorer containers |
| database.database | string | `"datacube"` |  |
| database.existingSecret | string | `"explorer-reader"` |  |
| database.host | string | `"localhost"` |  |
| database.passwordKey | string | `"postgres-password"` |  |
| database.port | int | `5432` |  |
| database.userKey | string | `"postgres-username"` |  |
| databaseManager.existingSecret | string | `"explorer-writer"` |  |
| databaseManager.passwordKey | string | `"postgres-password"` |  |
| databaseManager.userKey | string | `"postgres-username"` |  |
| dockerArgs[0] | string | `"gunicorn"` |  |
| dockerArgs[10] | string | `"60"` |  |
| dockerArgs[11] | string | `"--pid"` |  |
| dockerArgs[12] | string | `"gunicorn.pid"` |  |
| dockerArgs[13] | string | `"--worker-tmp-dir"` |  |
| dockerArgs[14] | string | `"/tmp"` |  |
| dockerArgs[15] | string | `"--no-control-socket"` |  |
| dockerArgs[16] | string | `"--access-logfile"` |  |
| dockerArgs[17] | string | `"-"` |  |
| dockerArgs[18] | string | `"--preload"` |  |
| dockerArgs[19] | string | `"--config"` |  |
| dockerArgs[1] | string | `"--bind"` |  |
| dockerArgs[20] | string | `"python:cubedash.gunicorn_config"` |  |
| dockerArgs[21] | string | `"cubedash:app"` |  |
| dockerArgs[2] | string | `"0.0.0.0:8080"` |  |
| dockerArgs[3] | string | `"--workers"` |  |
| dockerArgs[4] | string | `"3"` |  |
| dockerArgs[5] | string | `"--threads"` |  |
| dockerArgs[6] | string | `"2"` |  |
| dockerArgs[7] | string | `"--worker-class"` |  |
| dockerArgs[8] | string | `"gthread"` |  |
| dockerArgs[9] | string | `"--timeout"` |  |
| externalPort | int | `80` |  |
| hpa.enabled | bool | `true` |  |
| hpa.maxReplicas | int | `6` |  |
| hpa.metrics | list | `[]` |  |
| hpa.minReplicas | int | `1` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"ghcr.io"` |  |
| image.repository | string | `"opendatacube/explorer"` |  |
| image.tag | string | `""` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0] | string | `""` |  |
| ingress.ingressClassName | string | `""` | Name of the IngressClass to use. Left empty the cluster default applies. |
| ingress.path | string | `"/"` |  |
| ingress.pathType | string | `"Prefix"` | Ingress path type. One of Prefix, Exact or ImplementationSpecific. |
| internalPort | int | `8080` |  |
| livenessProbe | object | `{}` |  |
| pdb.annotations | object | `{}` |  |
| pdb.enabled | bool | `true` |  |
| pdb.minAvailable | int | `1` |  |
| podSecurityContext | object | `{"fsGroup":1000,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000,"seccompProfile":{"type":"RuntimeDefault"}}` | The SecurityContext for Explorer pods |
| readinessProbe | object | `{}` |  |
| replicaCount | int | `1` | Number of replicas. Ignored when `hpa.enabled` is true. |
| resources.limits.cpu | string | `"300m"` |  |
| resources.limits.memory | string | `"1024Mi"` |  |
| service.type | string | `"ClusterIP"` |  |
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
