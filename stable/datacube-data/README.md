# Datacube Data Orchestration

This helm chart will deploy a deployment for Datacube Data Orchestration which can automatically index new data that becomes available on AWS S3.

## ODC Database configuration
Connecting to your ODC Database is done using the `database` block. A kubernetes secret containing the `postgres-username` and `postgres-password` for your database is required. This is an example block for connecting to a psql database named 'odc' on `localhost:5432`:
```YAML
database:
  database: odc
  host: localhost
  port: 5432
  existingSecret: odc-secret
```
