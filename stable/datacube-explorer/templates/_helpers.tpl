{{/* vim: set filetype=mustache: */}}

{{/*
Expand the name of the chart.
*/}}
{{- define "datacube-explorer.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "datacube-explorer.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "datacube-explorer.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{- define "datacube-explorer.prefix" -}}
    {{- if .Values.prefix -}}
        {{.Values.prefix}}-
    {{- else -}}
    {{- end -}}
{{- end -}}


{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "datacube-explorer.postgresql.fullname" -}}
{{- if .Values.postgresql.fullnameOverride -}}
{{- .Values.postgresql.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.postgresql.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf " %s-%s" .Release.Name .Values.postgresql.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "datacube-explorer.dbenv" }}
{{- /* set DB_DATABASE */ -}}
{{- if .Values.postgresql.enabled }}
- name: DB_DATABASE
  value: {{ .Values.postgresql.postgresqlDatabase | quote }}
{{- else }}
- name: DB_DATABASE
  value: {{ .Values.externalPostgresql.database | quote }}
{{- end }}

{{- /* set DB_USERNAME */ -}}
{{- if .Values.postgresql.enabled }}
- name: DB_USERNAME
  value: {{ .Values.postgresql.postgresqlUsername | quote }}
{{- else }}
- name: DB_USERNAME
  value: {{ .Values.externalPostgresql.username | quote }}
{{- end }}

{{- /* set DB_PASSWORD */ -}}
{{- if .Values.postgresql.enabled }}
{{- if .Values.postgresql.existingSecret }}
- name: DB_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ .Values.postgresql.existingSecret }}
      key: {{ .Values.postgresql.existingSecretKey }}
{{- else }}
- name: DB_PASSWORD
  value: {{ .Values.postgresql.postgresqlPassword }}
{{- end }}
{{- else }}
- name: DB_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ .Values.externalPostgresql.existingSecret }}
      key: {{ .Values.externalPostgresql.existingSecretPasswordKey }}
{{- end }}

{{/* Set DB_PORT */}}
{{- if .Values.postgresql.enabled -}}
- name: DB_PORT
  value: {{ .Values.postgresql.port | quote }}
{{- else -}}
- name: DB_PORT
  value: {{ .Values.externalPostgresql.port | quote }}
{{- end }}

{{/* Set DB_HOSTNAME */}}
{{- if .Values.postgresql.enabled -}}
- name: DB_HOSTNAME
  value: {{ include "datacube-explorer.postgresql.fullname" . }}
{{- else -}}
- name: DB_HOSTNAME
  value: {{ .Values.externalPostgresql.host |quote }}
{{- end }}
{{- end }}
