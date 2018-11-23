#!/bin/bash
set -e

# Deploy Charts
#
# Usage:
# deploy-charts.sh <repo> <folder>
#
# Info
# Packages every chart in the folder as a tarball
# Tries to upload each chart to the repo

repo="$1"
pushd $2
ls | xargs -n 1 echo helm package -u | bash
ls | grep ".tgz" | xargs -I{} -n 1 sh -c "helm s3 push --acl=\"bucket-owner-full-control\" {} $repo || :"
ls | grep ".tgz" | xargs rm
popd