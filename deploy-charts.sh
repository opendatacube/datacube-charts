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
# Will perform actions twice to catch dependent charts

repo="$1"
folder="$2"

n=0
until [[ $n -ge 1 ]]; do
    # build helm charts and dependencies
    helm repo add datacube-charts $repo
    helm repo update
    # Package charts, may fail first time around
    helm package -u $folder/* || :

    # copy charts that don't already exist (ignore fail messages if they do)
    cp -nv *.tgz charts/ 2>/dev/null || :

    # clean up duplicate charts so they don't polute the website
    rm *.tgz

    # rebuild index
    helm repo index charts --url $repo
    ((n++))
done
