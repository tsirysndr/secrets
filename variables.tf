variable "gcp_credentials" {
  type       = string
  description = "GCP credentials"
}

variable "gcp_project" {
  type        = string
  description = "GCP project"
}

variable "gcp_region" {
  type        = string
  description = "GCP region"
  default = "us-east1"
}

variable "secrets" {
  type        = map(string)
  description = "A map of secrets names and their respective values"
}