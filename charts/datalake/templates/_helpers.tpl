{{/* vim: set filetype=mustache: */}}
{{/*
Create a short app name.
*/}}
{{- define "datalake.name" -}}
datalake
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

{* Hiveservice Variables *}
{{- define "datalake.hiveservice.name" -}}
{{- template "datalake.name" . -}}-hiveservice
{{- end -}}

{{- define "datalake.hiveservice.fullname" -}}
{{- $fullname := include "datalake.fullname" . -}}
{{- if contains "hiveservice" $fullname -}}
{{- printf "%s" $fullname -}}
{{- else -}}
{{- printf "%s-hiveservice" $fullname | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{* Hiveserver Variables *}
{{- define "datalake.hiveserver.name" -}}
{{- template "datalake.name" . -}}-hiveserver
{{- end -}}

{{- define "datalake.hiveserver.fullname" -}}
{{- $fullname := include "datalake.fullname" . -}}
{{- if contains "hiveserver" $fullname -}}
{{- printf "%s" $fullname -}}
{{- else -}}
{{- printf "%s-hiveserver" $fullname | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{* Spark (Master) Variables *}
{{- define "datalake.spark-master.hostname" -}}
spark-master
{{- end -}}

{{- define "datalake.spark-master.name" -}}
{{- template "datalake.name" . -}}-spark-master
{{- end -}}

{{- define "datalake.spark-master.fullname" -}}
{{- $fullname := include "datalake.fullname" . -}}
{{- if contains "spark-master" $fullname -}}
{{- printf "%s" $fullname -}}
{{- else -}}
{{- printf "%s-spark-master" $fullname | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{* Spark (Worker) Variables *}
{{- define "datalake.spark-worker.name" -}}
{{- template "datalake.name" . -}}-spark-worker
{{- end -}}

{{- define "datalake.spark-worker.fullname" -}}
{{- $fullname := include "datalake.fullname" . -}}
{{- if contains "spark-worker" $fullname -}}
{{- printf "%s" $fullname -}}
{{- else -}}
{{- printf "%s-spark-worker" $fullname | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{* Spark (Proxy) Variables *}
{{- define "datalake.spark-proxy.name" -}}
{{- template "datalake.name" . -}}-spark-proxy
{{- end -}}

{{- define "datalake.spark-proxy.fullname" -}}
{{- $fullname := include "datalake.fullname" . -}}
{{- if contains "spark-proxy" $fullname -}}
{{- printf "%s" $fullname -}}
{{- else -}}
{{- printf "%s-spark-proxy" $fullname | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{* Spark Hadoop (Master) Variables *}
{{- define "datalake.spark-hadoop-master.hostname" -}}
spark-hadoop-master
{{- end -}}

{{- define "datalake.spark-hadoop-master.name" -}}
{{- template "datalake.name" . -}}-spark-hadoop-master
{{- end -}}

{{- define "datalake.spark-hadoop-master.fullname" -}}
{{- $fullname := include "datalake.fullname" . -}}
{{- if contains "spark-hadoop-master" $fullname -}}
{{- printf "%s" $fullname -}}
{{- else -}}
{{- printf "%s-spark-hadoop-master" $fullname | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{* Spark Hadoop (Worker) Variables *}
{{- define "datalake.spark-hadoop-worker.name" -}}
{{- template "datalake.name" . -}}-spark-hadoop-worker
{{- end -}}

{{- define "datalake.spark-hadoop-worker.fullname" -}}
{{- $fullname := include "datalake.fullname" . -}}
{{- if contains "spark-hadoop-worker" $fullname -}}
{{- printf "%s" $fullname -}}
{{- else -}}
{{- printf "%s-spark-hadoop-worker" $fullname | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{* Spark Hadoop (Proxy) Variables *}
{{- define "datalake.spark-hadoop-proxy.name" -}}
{{- template "datalake.name" . -}}-spark-hadoop-proxy
{{- end -}}

{{- define "datalake.spark-hadoop-proxy.fullname" -}}
{{- $fullname := include "datalake.fullname" . -}}
{{- if contains "spark-hadoop-proxy" $fullname -}}
{{- printf "%s" $fullname -}}
{{- else -}}
{{- printf "%s-spark-hadoop-proxy" $fullname | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
