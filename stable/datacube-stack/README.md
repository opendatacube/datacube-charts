datacube-stack
==============
A Helm chart for Opendatacube

Current chart version is `0.0.1`



## Chart Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.helm.sh/stable | postgresql | 8.6.4 |

## Chart Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| postgresql.enabled | bool | `true` |  |
| postgresql.nameOverride | string | `"datacube-postgresql"` |  |
| postgresql.persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| postgresql.persistence.enabled | bool | `true` |  |
| postgresql.persistence.size | string | `"8Gi"` |  |
| postgresql.persistence.storageClass | string | `""` |  |
| postgresql.postgresqlDatabase | string | `"datacube"` |  |
| postgresql.postgresqlPassword | string | `"datacube-admin-password"` |  |
| postgresql.postgresqlUsername | string | `"datacube-admin"` |  |
| postgresql.replication.applicationName | string | `"datacube"` |  |
| postgresql.replication.enabled | bool | `false` |  |
| postgresql.replication.numSynchronousReplicas | int | `1` |  |
| postgresql.replication.readReplicas | int | `2` |  |
| postgresql.replication.synchronousCommit | string | `"on"` |  |
