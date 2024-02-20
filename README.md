# Secrets 🏠 🔐

[![terraform apply](https://github.com/tsirysndr/secrets/actions/workflows/deploy.yml/badge.svg)](https://github.com/tsirysndr/secrets/actions/workflows/deploy.yml)

This is my [terraform](https://terraform.io) code to keep all my secrets in sync across all my devices. It uses Google Secret Manager and Cloudflare Wroker Secrets to store the secrets so I can access them from anywhere later using [teller](https://tlr.dev/).

I use [Github Secrets](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions) as a single source of truth for my secrets. Github Actions will then use this terraform code to store the secrets in Google Secret Manager and Cloudflare Secrets.

## 🚀 Quickstart

1 . Clone this repository

```sh
gh repo clone tsirysndr/secrets && cd secrets
```

2 . Create a `secrets.tfvars` file with the following content:

```hcl
gcp_credentials = "path/to/your/credentials.json"

gcp_project = "your-gcp-project"

secrets = {
  "secret-1" = "super-secret-value-1",
  "secret-2" = "super-secret-value-2"
}
```

3 . Run the following commands:

```sh
terraform init
terraform validate
terraform plan -var-file=secrets.tfvars
terraform apply -var-file=secrets.tfvars
```

## 📥 Inputs 

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| account_id | The Cloudflare account id | `string` | n/a | yes |
| cloudflare_api_token | The Cloudflare API token | `string` | n/a | yes |
| gcp_credentials | The path to the GCP credentials file | `string` | n/a | yes |
| gcp_project | The GCP project id | `string` | n/a | yes |
| gcp_region | The GCP region to create the secret | `string` | `us-east1` | no |
| secrets | A map of secrets to store in Google Secret Manager | `map(string)` | n/a | yes |
| worker_name | The Cloudflare worker name | `string` | n/a | yes |

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
