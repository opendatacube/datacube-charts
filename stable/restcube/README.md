restcube
========
A Helm chart for Deploying RestCube

Current chart version is `0.2.9`





## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| annotations | object | `{}` |  |
| containerPort | int | `8080` |  |
| database.database | string | `"datacube"` |  |
| database.existingSecret | string | `"datacube"` |  |
| database.host | string | `"localhost"` |  |
| database.port | int | `5432` |  |
| dockerArgs | list | `[]` |  |
| environment | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"opendatacube/restcube"` |  |
| image.tag | string | `"latest"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0] | string | `"chart-example.local"` |  |
| ingress.path | string | `"/"` |  |
| ingress.tls | list | `[]` |  |
| livenessProbe | object | `{}` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| readinessProbe | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| service.internal.enabled | bool | `false` |  |
| service.internal.port | int | `80` |  |
| service.internal.type | string | `"LoadBalancer"` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| tolerations | list | `[]` |  |
| worker.affinity | object | `{}` |  |
| worker.annotations | object | `{}` |  |
| worker.dockerArgs | list | `[]` |  |
| worker.environment | object | `{}` |  |
| worker.livenessProbe | object | `{}` |  |
| worker.nodeSelector | object | `{}` |  |
| worker.readinessProbe | object | `{}` |  |
| worker.replicaCount | int | `1` |  |
| worker.resources | object | `{}` |  |
| worker.tolerations | list | `[]` |  |
