# The following block are used to retrieve secrets and their latest version values for a given application.
data "hcp_vault_secrets_secret" "Aws_Access_Key_Id" {
  app_name    = "AWS"
  secret_name = "AWS_ACCESS_KEY_ID"
}

data "hcp_vault_secrets_secret" "Aws_Secret_Access_Key" {
  app_name    = "AWS"
  secret_name = "AWS_ACCESS_KEY_ID"
}