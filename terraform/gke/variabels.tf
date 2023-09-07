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
    default     = "e2-small"
}
variable "machine_type_spot" {
    description = "The machine type of the spot node pool"
    type        = string
    default     = "e2-small"
}