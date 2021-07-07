datacube-data
=============
A Helm chart for running datacube data management

Current chart version is `0.2.6`





## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalEnvironmentVars | object | `{}` |  |
| affinity | object | `{}` |  |
| annotations."iam.amazonaws.com/role" | string | `"kubernetes-orchestration"` |  |
| aws_region | string | `"ap-southeast-2"` |  |
| database.database | string | `"datacube"` |  |
| database.existingSecret | string | `"datacube"` |  |
| database.host | string | `"localhost"` |  |
| database.port | int | `5432` |  |
| dockerArgs[0] | string | `"python3"` |  |
| dockerArgs[1] | string | `"orchestrate.py"` |  |
| fullnameOverride | string | `""` |  |
| global.externalDatabase | object | `{}` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.repository | string | `"geoscienceaustralia/dea-k8s-data"` |  |
| image.tag | string | `"latest"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| sqs_queue_name | string | `""` |  |
| tolerations | list | `[]` |  |
| wmsConfig.image | object | `{}` |  |
