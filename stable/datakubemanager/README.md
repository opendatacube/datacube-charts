# Datakubemanager

## Requirements
* Deployed Restcube

## Datakubemanager
The Datakubemanager deployment is managed by `deployment.yaml`

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