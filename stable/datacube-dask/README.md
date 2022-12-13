# datacube-dask

![Version: 0.4.10](https://img.shields.io/badge/Version-0.4.10-informational?style=flat-square) ![AppVersion: alpha](https://img.shields.io/badge/AppVersion-alpha-informational?style=flat-square)

Distributed Dask for Datacube

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| adaptive.enabled | bool | `false` |  |
| dask.kubernetes.count.max | int | `4` |  |
| dask.kubernetes.count.min | int | `2` |  |
| dask.kubernetes.count.start | int | `2` |  |
| dask.kubernetes.env | object | `{}` |  |
| dask.kubernetes.host | string | `"0.0.0.0"` |  |
| dask.kubernetes.name | string | `"dask-{uuid}"` |  |
| dask.kubernetes.namespace | string | `nil` |  |
| dask.kubernetes.port | int | `8786` |  |
| dask.kubernetes.worker-template-path | string | `nil` |  |
| dask.kubernetes.worker-template.kind | string | `"Pod"` |  |
| dask.kubernetes.worker-template.metadata.annotations."iam.amazonaws.com/role" | string | `"kubernetes-wms"` |  |
| dask.kubernetes.worker-template.metadata.labels.app | string | `"dask"` |  |
| dask.kubernetes.worker-template.spec.containers[0].args[0] | string | `"dask-worker"` |  |
| dask.kubernetes.worker-template.spec.containers[0].args[1] | string | `"--nthreads"` |  |
| dask.kubernetes.worker-template.spec.containers[0].args[2] | string | `"2"` |  |
| dask.kubernetes.worker-template.spec.containers[0].args[3] | string | `"--no-bokeh"` |  |
| dask.kubernetes.worker-template.spec.containers[0].args[4] | string | `"--memory-limit"` |  |
| dask.kubernetes.worker-template.spec.containers[0].args[5] | string | `"6GB"` |  |
| dask.kubernetes.worker-template.spec.containers[0].args[6] | string | `"--death-timeout"` |  |
| dask.kubernetes.worker-template.spec.containers[0].args[7] | string | `"60"` |  |
| dask.kubernetes.worker-template.spec.containers[0].image | string | `"opendatacube/dask:latest"` |  |
| dask.kubernetes.worker-template.spec.containers[0].name | string | `"dask"` |  |
| dask.kubernetes.worker-template.spec.containers[0].resources.limits.cpu | string | `"2"` |  |
| dask.kubernetes.worker-template.spec.containers[0].resources.limits.memory | string | `"6G"` |  |
| dask.kubernetes.worker-template.spec.containers[0].resources.requests.cpu | string | `"2"` |  |
| dask.kubernetes.worker-template.spec.containers[0].resources.requests.memory | string | `"6G"` |  |
| dask.kubernetes.worker-template.spec.restartPolicy | string | `"Never"` |  |
| database.database | string | `"datacube"` |  |
| database.existingSecret | string | `"datacube"` |  |
| database.host | string | `"localhost"` |  |
| database.port | int | `5432` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.repository | string | `"opendatacube/dask"` |  |
| image.tag | string | `"latest"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0] | string | `"chart-example.local"` |  |
| ingress.path | string | `"/"` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| scheduler.affinity | object | `{}` |  |
| scheduler.bokehPort | int | `8787` |  |
| scheduler.command[0] | string | `"dask-scheduler"` |  |
| scheduler.env.DASK_CONFIG | string | `"/etc/config/datacube/dask/kubernetes.yaml"` |  |
| scheduler.nodeSelector | object | `{}` |  |
| scheduler.port | int | `8786` |  |
| scheduler.replicaCount | int | `1` |  |
| scheduler.resources | object | `{}` |  |
| scheduler.tolerations | list | `[]` |  |
| service.bokehPort | int | `8787` |  |
| service.port | int | `8786` |  |
| service.type | string | `"NodePort"` |  |
| worker.affinity | object | `{}` |  |
| worker.annotations."iam.amazonaws.com/role" | string | `"kubernetes-wms"` |  |
| worker.args[0] | string | `"--nthreads"` |  |
| worker.args[1] | string | `"2"` |  |
| worker.args[2] | string | `"--no-bokeh"` |  |
| worker.args[3] | string | `"--memory-limit"` |  |
| worker.args[4] | string | `"6GB"` |  |
| worker.args[5] | string | `"--death-timeout"` |  |
| worker.args[6] | string | `"60"` |  |
| worker.command[0] | string | `"docker-entrypoint.sh"` |  |
| worker.maxReplicas | int | `10` |  |
| worker.minReplicas | int | `1` |  |
| worker.nodeSelector | object | `{}` |  |
| worker.port | int | `8789` |  |
| worker.resources.limits.cpu | string | `"2"` |  |
| worker.resources.limits.memory | string | `"6G"` |  |
| worker.resources.requests.cpu | string | `"2"` |  |
| worker.resources.requests.memory | string | `"6G"` |  |
| worker.targetCpu | int | `75` |  |
| worker.targetMemory | int | `75` |  |
| worker.tolerations | list | `[]` |  |

