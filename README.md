<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (> 1.3.1)

- <a name="requirement_github"></a> [github](#requirement\_github) (5.44.0)

- <a name="requirement_hcp"></a> [hcp](#requirement\_hcp) (0.76.0)

- <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) (0.48.0)

## Providers

The following providers are used by this module:

- <a name="provider_hcp"></a> [hcp](#provider\_hcp) (0.76.0)

- <a name="provider_terraform"></a> [terraform](#provider\_terraform)

- <a name="provider_tfe"></a> [tfe](#provider\_tfe) (0.48.0)

## Modules

The following Modules are called:

### <a name="module_agent"></a> [agent](#module\_agent)

Source: ./modules/tfe_agent

Version:

### <a name="module_notifications"></a> [notifications](#module\_notifications)

Source: ./modules/tfe_notification

Version:

### <a name="module_repository"></a> [repository](#module\_repository)

Source: ./modules/github_repository

Version:

### <a name="module_teams"></a> [teams](#module\_teams)

Source: ./modules/tfe_team

Version:

### <a name="module_workspaces"></a> [workspaces](#module\_workspaces)

Source: ./modules/tfe_workspace

Version:

## Resources

The following resources are used by this module:

- [tfe_project.project](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/resources/project) (resource)
- [tfe_project_variable_set.this](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/resources/project_variable_set) (resource)
- [tfe_variable.variable_set](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/resources/variable) (resource)
- [tfe_variable.variable_set_tfe_token](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/resources/variable) (resource)
- [tfe_variable.workspace](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/resources/variable) (resource)
- [tfe_variable.workspace_tfe_token](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/resources/variable) (resource)
- [tfe_variable_set.this](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/resources/variable_set) (resource)
- [tfe_workspace_variable_set.this](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/resources/workspace_variable_set) (resource)
- [hcp_vault_secrets_secret.this](https://registry.terraform.io/providers/hashicorp/hcp/0.76.0/docs/data-sources/vault_secrets_secret) (data source)
- [terraform_remote_state.aws-oidc-terraformcloud](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) (data source)
- [tfe_oauth_client.client](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/data-sources/oauth_client) (data source)
- [tfe_organization.this](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/data-sources/organization) (data source)
- [tfe_workspace.this](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/data-sources/workspace) (data source)

## Required Inputs

No required inputs.

## Optional Inputs

No optional inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->