#!/bin/bash
cd terraform
# Create GKE Cluster
echo "Starting GKE cluster creation in Google Cloud"
cd gke
terraform init
terraform apply -auto-approve

cd ..
echo "GKE cluster creation completed"
gcloud container clusters get-credentials primary-cluster --zone us-central1-a --project evident-catcher-397908

# Create ArgoCD
echo "Starting ArgoCD creation"
cd argocd
terraform init
terraform apply -auto-approve

cd ..
echo "ArgoCD creation completed"