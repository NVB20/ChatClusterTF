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
    }
}