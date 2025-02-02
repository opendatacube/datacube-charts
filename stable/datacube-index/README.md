# datacube-index

![Version: 0.4.4](https://img.shields.io/badge/Version-0.4.4-informational?style=flat-square)

Datacube OGC Web Services Indexing

**Homepage:** <https://www.opendatacube.org/documentation>

## Source Code

* <https://github.com/opendatacube/datacube-core>
* <https://github.com/opendatacube/datacube-ows>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| archive.additionalEnvironmentVars | object | `{}` |  |
| archive.annotations."iam.amazonaws.com/role" | string | `"kubernetes-wms"` |  |
| archive.bucket | string | `"dea-public-data"` |  |
| archive.cron | string | `"0 0 31 2 *"` |  |
| archive.days | string | `nil` |  |
| archive.dockerArgs[0] | string | `"/bin/bash"` |  |
| archive.dockerArgs[1] | string | `"-c"` |  |
| archive.dockerArgs[2] | string | `"cd archive; ./archive-wrapper.sh"` |  |
| archive.enable | bool | `false` |  |
| archive.historyLimit | int | `5` |  |
| archive.imageTag | string | `"archive-k"` |  |
| archive.prefix | list | `[]` |  |
| archive.resources.limits.cpu | string | `"500m"` |  |
| archive.resources.limits.memory | string | `"1024Mi"` |  |
| archive.resources.requests.cpu | string | `"300m"` |  |
| archive.resources.requests.memory | string | `"768Mi"` |  |
| archive.suffix | string | `".yaml"` |  |
| archive.suspend | bool | `true` |  |
| cron.concurrencyPolicy | string | `"Allow"` |  |
| cron.enabled | bool | `false` |  |
| cron.historyLimit | int | `1` |  |
| cron.schedule | string | `"0 0 * * *"` |  |
| cron.suspend | bool | `false` |  |
| database.database | string | `"datacube"` |  |
| database.existingSecret | string | `"datacube"` |  |
| database.host | string | `"localhost"` |  |
| database.port | int | `5432` |  |
| datacube.products | list | `[]` |  |
| datacube.wmsConfigURL | string | `""` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"opendatacube/ows"` |  |
| image.tag | string | `"latest"` |  |
| index.additionalEnvironmentVars | object | `{}` |  |
| index.annotations."iam.amazonaws.com/role" | string | `"kubernetes-wms"` |  |
| index.bucket | string | `"dea-public-data"` |  |
| index.dockerArgs[0] | string | `"/bin/bash"` |  |
| index.dockerArgs[1] | string | `"-c"` |  |
| index.dockerArgs[2] | string | `"cd index; ./create-index.sh"` |  |
| index.exclude_product | string | `nil` |  |
| index.ignore | list | `[]` |  |
| index.ignore_lineage | string | `nil` |  |
| index.multiproduct_ranges | string | `nil` |  |
| index.prefix | list | `[]` |  |
| index.product_ranges | string | `nil` |  |
| index.products | string | `nil` |  |
| index.resources.limits.cpu | string | `"500m"` |  |
| index.resources.limits.memory | string | `"1024Mi"` |  |
| index.resources.requests.cpu | string | `"300m"` |  |
| index.resources.requests.memory | string | `"768Mi"` |  |
| index.suffix | string | `".yaml"` |  |
| index.thredds_days | string | `nil` |  |
| index.wmsConfigURL | string | `nil` |  |
| index.yaml_safety | string | `nil` |  |
| wmsConfig.image | object | `{}` |  |

