provider "google" {
  credentials = file(var.gcp_credentials)
  project     = var.gcp_project
  region      = var.gcp_region
}

resource "google_project_service" "secretmanager" {
  provider = google
  service = "secretmanager.googleapis.com"
}

resource "google_secret_manager_secret" "secrets" {
  for_each = var.secrets
  provider = google
  secret_id = each.key

  replication  {
    user_managed {
      replicas {
        location = "us-central1"
      }
      replicas {
        location = "us-east1"
      }
    }
  }

  depends_on = [google_project_service.secretmanager]
}

resource "google_secret_manager_secret_version" "secrets" {
  for_each = var.secrets
  provider = google
  secret = google_secret_manager_secret.secrets[each.key].id
  secret_data = var.secrets[each.key]
}

terraform {
  backend "gcs" {
    bucket = "fluentci-tf-state"
    prefix = "state/secrets.tfstate"
  }
}
