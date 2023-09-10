#provider
variable "project_id" {
    description = "The ID of the GCP project"
    type        = string
    default     = "evident-catcher-397908"
}
variable "project_region" {
    description = "The region of the GCP project"
    type        = string
    default     = "us-central1"
}
variable "machine_type_general" {
    description = "The machine type of the general node pool"
    type        = string
    default     = "e2-medium"
}
variable "cluster_region" {
    description = "The region of the GCP project"
    type        = string
    default     = "us-central1-f"
}
