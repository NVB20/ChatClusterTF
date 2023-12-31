resource "google_container_cluster" "primary-cluster" {
  provider = google-beta
  name                     = "primary-cluster"
  location                 = var.cluster_region
  project = var.project_id
  
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.main-vpc.self_link
  subnetwork               = google_compute_subnetwork.private-subnet.self_link
  
  networking_mode          = "VPC_NATIVE"

  # # Optional, if you want multi-zonal cluster
  # node_locations = [
  #   "us-central1-b"
  # ]

  addons_config {
    http_load_balancing {
      disabled = false
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
  }

  release_channel {
    channel = "REGULAR"
  }

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  ip_allocation_policy {
    cluster_secondary_range_name  = "k8s-pod-range"
    services_secondary_range_name = "k8s-service-range"
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "172.16.0.0/28"
  }

  monitoring_config {

    enable_components = ["SYSTEM_COMPONENTS"]

    managed_prometheus {
      enabled = true
    }
  }

}