#!/bin/bash

# Variables
PROJECT_ID="evident-catcher-397908"
ZONE="us-central1-f"
GRAFANA_NS="grafana"

# Create GKE Cluster
echo "Starting GKE cluster creation in Google Cloud"
cd terraform/gke
terraform init
terraform apply -auto-approve
cd -
echo "GKE cluster creation completed"

# Connect to Google Cloud
echo "Connecting to google cloud"
gcloud container clusters get-credentials primary-cluster --zone $ZONE --project $PROJECT_ID

# Google Managed Prometheus
echo "Giving Google Managed Prometheus access"
kubectl annotate serviceaccount collector --namespace gmp-system iam.gke.io/gcp-service-account=collector@${PROJECT_ID}.iam.gserviceaccount.com
echo "Managed Prometheus completed"

# Create ArgoCD
echo "Starting ArgoCD creation"
cd terraform/argocd
terraform init
terraform apply -auto-approve
cd -
echo "ArgoCD creation completed"

echo "Access Cloud Monitoring via Grafana:"
echo "Grafana is available at: http://127.0.0.1:3000"
kubectl port-forward -n ${GRAFANA_NS} svc/grafana 3000:3000