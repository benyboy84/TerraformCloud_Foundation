# The following block are used to retrieve secrets and their latest version values for a given application.
data "hcp_vault_secrets_secret" "aws_access_key_id" {
  app_name    = "AWS"
  secret_name = "AWS_ACCESS_KEY_ID"
}

data "hcp_vault_secrets_secret" "aws_secret_access_key" {
  app_name    = "AWS"
  secret_name = "AWS_ACCESS_KEY_ID"
}