# datacube-ows

Datacube Web Map Service

Current chart version is `0.19.0`

Source code can be found [here](https://www.opendatacube.org/documentation)

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| clusterInfo.envName | string | `"dev"` |  |
| database.database | string | `"datacube"` |  |
| database.existingSecret | string | `nil` |  |
| database.host | string | `"localhost"` |  |
| database.port | int | `5432` |  |
| ingress.ingressClassName | string | `""` |  | 
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0] | string | `""` |  |
| ingress.path | string | `"/"` |  |
| ingress.redirect | bool | `false` |  |
| maxReplicas | int | `2` |  |
| minReplicas | int | `1` |  |
| ows.annotations."iam.amazonaws.com/role" | string | `"kubernetes-wms"` |  |
| ows.dockerArgs[0] | string | `"gunicorn"` |  |
| ows.dockerArgs[1] | string | `"-b"` |  |
| ows.dockerArgs[2] | string | `"0.0.0.0:8000"` |  |
| ows.dockerArgs[3] | string | `"-w"` |  |
| ows.dockerArgs[4] | string | `"4"` |  |
| ows.dockerArgs[5] | string | `"--keep-alive"` |  |
| ows.dockerArgs[6] | string | `"50"` |  |
| ows.dockerArgs[7] | string | `"--timeout"` |  |
| ows.dockerArgs[8] | string | `"120"` |  |
| ows.dockerArgs[9] | string | `"datacube_ows.wsgi"` |  |
| ows.enabled | bool | `true` |  |
| ows.externalPort | int | `80` |  |
| ows.hpa.autoscaling | bool | `true` |  |
| ows.hpa.metrics | object | `{}` |  |
| ows.image.pullPolicy | string | `"Always"` |  |
| ows.image.registry | string | `"docker.io"` |  |
| ows.image.repository | string | `"opendatacube/ows"` |  |
| ows.image.tag | string | `"latest"` |  |
| ows.internalPort | int | `8000` |  |
| ows.livenessProbe | object | `{}` |  |
| ows.maxSurge | string | `"25%"` |  |
| ows.maxUnavailable | string | `"25%"` |  |
| ows.readinessProbe | object | `{}` |  |
| ows.resources.limits.cpu | string | `"1"` |  |
| ows.resources.limits.memory | string | `"2048Mi"` |  |
| ows.securityContext | object | `{}` | Deployment level security context |
| ows.startupProbe | object | `{}` |  |
| owsConfig.image.cfg_folder | string | `"/code/integration_tests/cfg"` |  |
| owsConfig.image.pullPolicy | string | `"Always"` |  |
| owsConfig.image.registry | string | `"docker.io"` |  |
| owsConfig.image.repository | string | `"opendatacube/ows"` |  |
| owsConfig.image.tag | string | `"latest"` |  |
| owsConfig.ows_cfg | string | `"cfg.ows_test_cfg.ows_cfg"` |  |
| owsConfig.path | string | `"/env/config"` |  |
| owsConfig.securityContext | object | `{}` | Container level security context |
| profiling.enabled | bool | `false` |  |
| profiling.path | string | `"/opt/profiling/"` |  |
| prometheus.enabled | bool | `false` |  |
| prometheus.path | string | `"/opt/prometheus/"` |  |
| pyspy.image | object | `{}` |  |
| pyspy.resources.limits.cpu | string | `"0.125"` |  |
| pyspy.resources.limits.memory | string | `"512Mi"` |  |
| service.type | string | `"NodePort"` |  |
| serviceAccount | object | `{}` | See configuration below |
| tolerations | object | `{}` |  |

## Service Account configuration
To configure for AWS IAM Roles for Service Accounts you need to specify an annotation for the service account creation (`enabled: True`) or supply an existing service account (`enabled: False`).

In the example below replace the two variables `${...}` with your clusters values.

```
serviceAccount:
  enabled: True
  name: ${service_account_name}
  annotations:
    eks.amazonaws.com/role-arn: ${service_account_role_arn}
securityContext:
  fsGroup: 65534 # For datacube-ows to read Kubernetes and AWS token files
```
