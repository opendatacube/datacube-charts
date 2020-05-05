{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "datacube-ows.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "datacube-ows.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Get the password secret.
*/}}
{{- define "datacube-ows.secretName" -}}
{{- if .Values.database.existingSecret }}
    {{- printf "%s" .Values.database.existingSecret -}}
{{- else -}}
    {{- printf "%s" (include "datacube-ows.fullname" .) -}}
{{- end -}}
{{- end -}}