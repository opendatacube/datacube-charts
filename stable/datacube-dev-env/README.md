# datacube-dev-env

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![AppVersion: 1.0](https://img.shields.io/badge/AppVersion-1.0-informational?style=flat-square)

A Helm chart for deploying a development environment to kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalEnvironmentVars | object | `{}` |  |
| additionalSettings | object | `{}` |  |
| annotations."iam.amazonaws.com/role" | string | `"dev-eks-datacube-wms"` |  |
| clusterInfo.envName | string | `"dev"` |  |
| containerPort | int | `8080` |  |
| createdb.dockerArgs[0] | string | `"/bin/sh"` |  |
| createdb.dockerArgs[1] | string | `"-c"` |  |
| createdb.dockerArgs[2] | string | `"/code/setup/create-db.sh"` |  |
| createdb.image.pullPolicy | string | `"Always"` |  |
| createdb.image.registry | string | `"docker.io"` |  |
| createdb.image.repository | string | `"opendatacube/wms"` |  |
| createdb.image.tag | string | `"latest"` |  |
| database.adminSecret | string | `"dev-eks-datacube"` |  |
| database.create | bool | `false` |  |
| database.database | string | `"testdb"` |  |
| database.existingSecret | string | `"dev-eks-datacube"` |  |
| database.host | string | `"database.local"` |  |
| database.port | int | `5432` |  |
| datacube.configPath | string | `"/opt/odc/datacube.conf"` |  |
| dockerArgs[0] | string | `"/bin/bash"` |  |
| dockerArgs[1] | string | `"-c"` |  |
| dockerArgs[2] | string | `"tail -f /dev/null"` |  |
| environment | string | `"dev"` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"opendatacube/k8s-dev"` |  |
| image.tag | string | `"latest"` |  |
| replicaCount | int | `1` |  |
| resources.limits.cpu | string | `"300m"` |  |
| resources.limits.memory | string | `"1024Mi"` |  |
| service.port | int | `80` |  |
| service.type | string | `"NodePort"` |  |

