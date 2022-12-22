# datacube-wps

![Version: 0.8.12](https://img.shields.io/badge/Version-0.8.12-informational?style=flat-square) ![AppVersion: alpha](https://img.shields.io/badge/AppVersion-alpha-informational?style=flat-square)

A Helm chart for Datacube WPS on Kubernetes

**Homepage:** <https://www.opendatacube.org/documentation>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Ben Lewis | <ben.lewis@ga.gov.au> |  |

## Source Code

* <https://github.com/opendatacube/datacube-core>
* <https://github.com/opendatacube/datacube-wps>

## Values

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

