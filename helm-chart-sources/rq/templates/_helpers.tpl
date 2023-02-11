{{/*
Expand the name of the chart.
*/}}
{{- define "rq.name" -}}
{{- printf "%s-%s" .Release.Name "rq" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "rq.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "rq.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "rq.labels" -}}
helm.sh/chart: {{ include "rq.chart" . }}
{{ include "rq.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "rq.selectorLabels" -}}
app.kubernetes.io/name: {{ include "rq.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "rq.serviceAccountName" -}}
{{- default (include "rq.name" .) .Values.rq.serviceAccount.name }}
{{- end }}


{{/*
Override namespace
*/}}
{{- define "rq.namespace" -}}
{{- default .Release.Namespace .Values.global.namespaceOverride }}
{{- end }}

{{/*
RQ Redis name
*/}}
{{- define "rq.redisName" -}}
{{- printf "%s-%s" .Release.Name "rq-redis" }}
{{- end }}

{{/*
RQ Dashboard name
*/}}
{{- define "rq.dashboardName" -}}
{{- printf "%s-%s" .Release.Name "rq-dashboard" }}
{{- end }}
