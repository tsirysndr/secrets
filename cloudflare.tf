terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

resource "cloudflare_worker_secret" "secrets" {
  for_each    = var.secrets
  provider    = cloudflare
  name        = upper(each.key)
  script_name = var.worker_name
  secret_text = var.secrets[each.key]
  account_id  = var.account_id
}
