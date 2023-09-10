resource "google_service_account" "kubernetes-admin" {
  account_id = "kubernetes-admin"
}

resource "google_container_node_pool" "general" {
  name       = "general"
  location   = var.cluster_region
  cluster    = google_container_cluster.primary-cluster.id
  node_count = 2

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    preemptible  = false
    machine_type = var.machine_type_general

    labels = {
      role = "general"
    }

    service_account = google_service_account.kubernetes-admin.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}