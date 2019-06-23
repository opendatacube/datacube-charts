# RESTcube

## Requirements
* Deployed Redis Cluster
* Accessible ODC database

## ODC Database configuration
Connecting to your ODC Database is done using the `database` block. A kubernetes secret containing the `postgres-username` and `postgres-password` for your database is required. This is an example block for connecting to a psql database named 'odc' on `localhost:5432`:
```YAML
database:
  database: odc
  host: localhost
  port: 5432
  existingSecret: odc-secret
```

## RESTcube
The restcube deployment is managed by `deployment.yaml`

## Workers
The workers for restcube are celery workers and are managed by the `celery-worker-deployment.yaml` template. More or less workers should be used based on the worker tasks. For example Data Load workers may need to have higher resource limits in order to process data.

## Ingress
### Internal
If desired, an internal ingress can be used as well (`service-internal.yaml`). For AWS this could be a load balancer which can only be accessed from within the cluster VPC and could allow AWS Lambdas unauthenticated access for example. The following annotation will enable a load balancer only accessible inside the VPC: `service.beta.kubernetes.io/aws-load-balancer-internal: "0.0.0.0/0"`

### External
For external facing ingress we recommend using some form of authentication. An example is an AWS ALB using Cognito based auth. For example the following annotations will enable cognito authentication for Azure SSO users with an appropriately configured cognito user pool.
```
alb.ingress.kubernetes.io/auth-type: cognito
alb.ingress.kubernetes.io/auth-on-unauthenticated-request: authenticate
alb.ingress.kubernetes.io/auth-scope: "email openid aws.cognito.signin.user.admin"
```