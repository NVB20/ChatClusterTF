provider "google" {
  project = var.project_id
  region  = var.project_region
}
# Only needed to enable managed prometheus
provider "google-beta" {
  project = var.project_id
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
