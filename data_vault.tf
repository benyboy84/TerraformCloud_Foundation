# The following block is use to retrieve secrets and their latest version values for a given application.
data "hcp_vault_secrets_app" "aws" {
  app_name = "AWS"
}