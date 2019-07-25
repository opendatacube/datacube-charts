# Sandbox Datacube Explorer / Dashboard

This helm chart will deploy a Sandbox Datacube Explorer deployment, service, and optionally ingress. It will also install postGIS on the target database so it can be used with the Explorer software.

## ODC Database configuration
Connecting to your ODC Database is done using the `database` block. A kubernetes secret containing the `postgres-username` and `postgres-password` for your database is required. Since postGIS will be installed a secret containing the `postgres-username` and `postgres-password` for a user with administrative privileges is also required. This is an example block for connecting to a psql database named 'odc' on `localhost:5432`:
```YAML
database:
  database: odc
  host: localhost
  port: 5432
  existingSecret: odc-secret
  adminSecret: psql-admin
```

## Providing additional settings to Sandbox Datacube Explorer
Sandbox Datacube Explorer is configurable using a `settings.env.py` file. This helm chart allows users to provide settings for this file as values in their helm chart. To do this provide a multi line string as the value for `additionalSettings` for example:
```YAML
additionalSettings: |
  CUBEDASH_THEME='dea'
  CUBEDASH_DEFAULT_PRODUCTS = ('ls8_nbar_scene', 'ls8_nbar_albers',)
  CUBEDASH_PROVENANCE_DISPLAY_LIMIT = 30
```

## Updating CubeDash Datasets
The `update_db.yaml` template is provided to create a cronjob which can update the cubedash database at regular intervals. It should generally call `cubedash-gen --all` which will update the cubedash database for all the datasets in the current datacube database.
