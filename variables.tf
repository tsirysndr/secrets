variable "cloudflare_api_token" {
  type        = string
  description = "Cloudflare API token"
}

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

variable "secrets_gcp" {
  type        = map(string)
  description = "A map of secrets names and their respective values"
}

variable "account_id" {
  type        = string
  description = "Cloudflare account ID"
}

variable "worker_name" {
  type        = string
  description = "Name of the Cloudflare Worker"
}
