datacube-wps
============
A Helm chart for Datacube WPS on Kubernetes

Current chart version is `0.8.9`





## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| aws.existingSecret | string | `"ows-wps-aws"` |  |
| database.database | string | `"datacube"` |  |
| database.existingSecret | string | `"datacube"` |  |
| database.host | string | `"localhost"` |  |
| database.port | int | `5432` |  |
| hpa.enabled | bool | `false` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"opendatacube/wps"` |  |
| image.tag | string | `"latest"` |  |
| ingress.domain | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.prefixes | list | `[]` |  |
| replicaCount | int | `1` |  |
| securityContext | object | `{}` |  |
| service.port | int | `8000` |  |
| service.type | string | `"NodePort"` |  |
| serviceAccountName | string | `""` |  |
| wps.additionalEnvironmentVars | object | `{}` |  |
| wps.annotations | object | `{}` |  |
| wps.baseurl | string | `""` |  |
| wps.enabled | bool | `true` |  |
| wps.livenessProbe | object | `{}` |  |
| wps.readinessProbe | object | `{}` |  |
| wps.resources.limits.cpu | string | `"2"` |  |
| wps.resources.limits.memory | string | `"2048Mi"` |  |
| wps.resources.requests.cpu | int | `1` |  |
| wps.resources.requests.memory | string | `"2048Mi"` |  |
| wps.securityContext | object | `{}` |  |
| wpsConfig.image | object | `{}` |  |
