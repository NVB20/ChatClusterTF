#!/bin/bash
cd terraform
# Create GKE Cluster
echo "Starting GKE cluster creation in Google Cloud"
cd gke
terraform init
terraform apply -auto-approve

cd ..
echo "GKE cluster creation completed"

echo "connecting to google cloud"
gcloud container clusters get-credentials primary-cluster --zone us-central1-a --project evident-catcher-397908

#prometheus
echo "giving google managed prometheus access"
kubectl annotate serviceaccount collector --namespace gmp-system iam.gke.io/gcp-service-account=collector@evident-catcher-397908.iam.gserviceaccount.com
echo "managed prometheus completed"

# Create ArgoCD
echo "Starting ArgoCD creation"
cd argocd
terraform init
terraform apply -auto-approve

cd ..
echo "ArgoCD creation completed" 
kubectl port-forward svc/argocd-server -n argocd  8081:443
echo "ArgoCD is open on: 127.0.0.1:8081"