# datakubemanager

![Version: 0.2.4](https://img.shields.io/badge/Version-0.2.4-informational?style=flat-square) ![AppVersion: 0.1](https://img.shields.io/badge/AppVersion-0.1-informational?style=flat-square)

A Helm chart for Deploying Datakubemanager

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| annotations | object | `{}` |  |
| cognito.existingSecret | string | `"restcubecognito"` |  |
| containerPort | int | `8080` |  |
| dockerArgs | list | `[]` |  |
| environment | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"geoscienceaustralia/datakubemanager"` |  |
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

