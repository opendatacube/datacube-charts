#!/usr/bin/env bash
set -exuo pipefail
IFS=$'\n\t'

CHART_DIRS="$(
  git diff --find-renames --name-only remotes/origin/master -- stable |
    awk 'tolower($0) ~ /\/chart\.yaml$/ { sub(/[\/][Cc]hart\.yaml$/, ""); print }'
)"
# Lowest supported k8s version as of 2026-07-02
KUBERNETES_VERSION="1.33"
SCHEMA_LOCATION="https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/"

if [[ -z "${CHART_DIRS}" ]]; then
  echo "No charts changed."
  exit 0
else
  echo "The following charts have changed: ${CHART_DIRS}"
fi

# install kubeval
curl --silent --show-error --fail --location --output /tmp/kubeval.tar.gz https://github.com/instrumenta/kubeval/releases/latest/download/kubeval-linux-amd64.tar.gz
tar -xf /tmp/kubeval.tar.gz kubeval

# validate charts
for CHART_DIR in ${CHART_DIRS}; do
  helm template "${CHART_DIR}" | ./kubeval --strict --ignore-missing-schemas --kubernetes-version "${KUBERNETES_VERSION#v}" --schema-location "${SCHEMA_LOCATION}${KUBERNETES_VERSION}"
done
