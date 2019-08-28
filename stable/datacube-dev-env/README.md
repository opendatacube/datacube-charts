# Kubernetes Development Environment Helm Template

This helm chart will deploy a Kubernetes development environment deployment, service, and optionally ingress. It will also install postGIS on the target database and grant `agdc_admin` role to superuser.

## ODC Database configuration
Connecting to your ODC Database is done using the `database` block. A kubernetes secret containing the `postgres-username` and `postgres-password` for your database is required. Since postGIS will be installed a secret containing the `postgres-username` and `postgres-password` for a user with administrative privileges is also required. This is an example block for connecting to a psql database named 'odc' on `localhost:5432`:
```YAML
database:
  create: true # if we need to create a database
  database: odc
  ref_database: ref_odc # Reference database name
  host: localhost
  port: 5432
  existingSecret: odc-secret
  adminSecret: psql-admin
```


