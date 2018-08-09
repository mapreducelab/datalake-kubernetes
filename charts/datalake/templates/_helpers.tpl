{{/* vim: set filetype=mustache: */}}
{{/*
Create a short app name.
*/}}
{{- define "datalake.name" -}}
hdfs
{{- end -}}

{{/*
Create a fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "datalake.fullname" -}}
{{- if .Values.global.fullnameOverride -}}
{{- .Values.global.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := include "datalake.name" . -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the subchart label.
*/}}
{{- define "datalake.subchart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "spark-fullname" -}}
{{- $fullname := include "datalake.fullname" . -}}
{{- if contains "spark" $fullname -}}
{{- printf "%s" $fullname -}}
{{- else -}}
{{- printf "%s-spark" $fullname | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
