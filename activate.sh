#!/bin/bash

# Variables
PROJECT_ID="evident-catcher-397908"
ZONE="us-central1-a"

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

# Opening services to connections
kubectl port-forward svc/argocd-server -n argocd 8081:443 
echo "ArgoCD is open on: https://127.0.0.1:8081"

kubectl port-forward -n my-grafana svc/grafana 3000:3000 
echo "Grafana is open on: http://127.0.0.1:3000"
