# The following block are used to retrieve secrets and their latest version values for a given application.
data "hcp_vault_secrets_secret" "AWS_Access_Key_ID" {
  app_name    = "AWS"
  secret_name = "AWS_ACCESS_KEY_ID"
}

data "hcp_vault_secrets_secret" "AWS_Secret_Access_Key" {
  app_name    = "AWS"
  secret_name = "AWS_ACCESS_KEY_ID"
}