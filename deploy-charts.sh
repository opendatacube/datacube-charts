#!/bin/bash

# Deploy Charts
#
# Usage:
# deploy-charts.sh <repo> <folder>
#
# Info
# Packages every chart in the folder as a tarball
# Will do a single pass for requirements which exist locally

repo="$1"
folder="$2"

# build helm charts and dependencies
helm repo add datacube-charts $repo
helm repo add stable https://charts.helm.sh/stable
helm repo update

# Find dependencies in datacube-charts which match $REPO
for chart in $folder/*
do
    mkdir -p "${chart}/charts"

    # Create local charts, do before remote to allow use of
    # freshly updated local charts
    helm dependency list "$chart" \
    | awk -v r="$repo" 'NR>1 {if (($3 == r) && ($4 != "ok")) print $1;}' \
    | xargs -n1 -I'{}' helm package "${folder}/{}" -d "${chart}/charts"
    
    #Manual fetch of remote charts
    helm dependency list "$chart" \
    | awk -v r="$repo" 'NR>1 {if (($3 != r) && ($4 != "ok")) print $3,$1;}' \
    | cut -d' ' -f1,2 \
    | xargs -n 2 /bin/bash -c 'helm fetch --repo "$1" --destination "$0/charts" "$2"' "$chart"

    helm package "$chart"
done

# copy charts that don't already exist (ignore fail messages if they do)
cp -nv *.tgz charts/ 2>/dev/null || :

# clean up duplicate charts so they don't polute the website
rm *.tgz

# rebuild index
helm repo index charts --url $repo
