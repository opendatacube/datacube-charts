# ODC S3 Index Job


This manifest will create a one-off job to index data from S3

Create a local file called `kustomization.yaml` with these contents:

```
generatorOptions:
  disableNameSuffixHash: true
secretGenerator:
- name: odc-s3-index-config
  literals:
    - DATACUBE_DB_URL=postgresql://username:password@host:5432/database
    - PRODUCT_FILE=https://raw.githubusercontent.com/GeoscienceAustralia/dea-config/master/dev/products/fc/ls5_fc_albers.yaml
    - BUCKET=dea-public-data
    - PREFIX=fractional-cover/fc/v2.2.1/ls5/**/*.yaml
    - AWS_ACCESS_KEY_ID=
    - AWS_SECRET_ACCESS_KEY=
    - AWS_DEFAULT_REGION=ap-southeast-2
```

Tweak the variables for your environment, then you can run it like `kubectl apply -k .`

This will create a local secret that you can use to run jobs by running `kubectl apply -f <raw github url of odc-s3-index-job.yaml>`