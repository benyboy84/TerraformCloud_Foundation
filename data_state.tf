# The following block are used to retrieve information from state file.
data "terraform_remote_state" "AWS_OIDC_TerraformCloud" {
  backend = "remote"

  config = {
    organization = local.organization_name
    workspaces = {
      name = "AWS_OIDC_TerraformCloud"
    }
  }
}