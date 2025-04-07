{{/*
Create the full name for resources.
*/}}
{{- define "reverse-ip-chart.fullname" -}}
{{- .Release.Name | printf "%s-%s" .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/*
Create the name for a service account.
*/}}
{{- define "reverse-ip-chart.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{- default .Release.Name .Values.serviceAccount.name -}}
{{- else -}}
""
{{- end -}}
{{- end }}

{{/*
Common labels for resources.
*/}}
{{- define "reverse-ip-chart.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels for resources.
*/}}
{{- define "reverse-ip-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

