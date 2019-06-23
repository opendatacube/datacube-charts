# Datacube WPS

This helm chart will deploy a deployment, service, and optionally ingress for a Datacube WPS deployment. This WPS can be used to provide processing services for a connected ODC database.

## ODC Database configuration
Connecting to your ODC Database is done using the `database` block. A kubernetes secret containing the `postgres-username` and `postgres-password` for your database is required. This is an example block for connecting to a psql database named 'odc' on `localhost:5432`:
```YAML
database:
  database: odc
  host: localhost
  port: 5432
  existingSecret: odc-secret
```

## WPS Baseurl
The WPS framework requires a 'baseurl' to be set by the operator which is the full path (including protocol) to the WPS (e.g. https://ows.dev.dea.ga.gov.au/wps/). This must be configured in the helm chart as `wps.baseurl` in addition to any ingress configuration done.