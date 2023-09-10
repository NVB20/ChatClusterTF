resource "google_service_account" "kubernetes_node" {
  account_id = "kubernetes-node"
  project = var.project_id
}