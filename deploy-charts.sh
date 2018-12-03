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
folder="$2"

# build helm charts and dependencies
helm repo add datacube-charts $repo
helm repo update
helm package -u $folder/* 

# copy charts that don't already exist (ignore fail messages if they do)
cp -nv *.tgz charts/ 2>/dev/null || :

# clean up duplicate charts so they don't polute the website
rm *.tgz

# rebuild index
helm repo index charts --url $repo
