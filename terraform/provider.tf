provider "google" {
  project = "evident-catcher-397908"
  region  = "us-central1"
}
terraform {
  backend "gcs" {
    bucket = "tfstate-bucket-september-2023"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

data "google_client_config" "provider" {}

# data "google_container_cluster" "primary-cluster" {
#   name     = "evident-catcher-397908"
#   location = "us-central1"
# }