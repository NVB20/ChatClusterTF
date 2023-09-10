variable "kube_config" {
  type    = string
  default = "~/.kube/config"
}
variable "namespace" {
  type    = string
  default = "monitoring"
}
variable "kube-version" {
    type    = string
    default = "50.0.0"
}
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