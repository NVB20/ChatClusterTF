provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

provider "kubernetes" {
  config_path = pathexpand(var.kube_config)
}

provider "google-beta" {
  project = var.project_id
  region  = var.project_region
}