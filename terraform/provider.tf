provider "google" {
   project = "evident-catcher-397908"
   credentials = "${file("key.json")}"
   region = "us-central1"
   zone = "us-central1-c"
}

terraform {
    backend "gcs" {
        bucket = "tfstate-bucket-september-2023"
        prefix = "terraform/state"
    }
    required_providers {
      google = {
        source = "hashicorp/google"
        version = "~>4.0"
      }
      helm = {
      source  = "hashicorp/helm"
      version = "= 2.11.0"
      }
    }
}

provider "helm" {
  kubernetes {
    host                   = "https://${google_container_cluster.primary-cluster.endpoint}"
    cluster_ca_certificate = base64decode(google_container_cluster.primary-cluster.master_auth.0.cluster_ca_certificate)
    token                  = data.google_client_config.current.access_token
  }
}