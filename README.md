<!-- BEGIN_TF_DOCS -->
# Terraform Cloud Foundation

Code which manages configuration and life-cycle of all the Terraform Cloud
foundation. It is designed to be used from a dedicated VCS-Driven Terraform
Cloud workspace that would provision and manage the configuration using
Terraform code (IaC).

## Permissions

To manage the resources from that code, provide a token from an account with
`owner` permissions. Alternatively, you can use a token from the `owner` team
instead of a user token.

## Authentication

The Terraform Cloud provider requires a Terraform Cloud/Enterprise API token in
order to manage resources.

- Set the `TFE_TOKEN` environment variable: The provider can read the TFE\_TOKEN environment variable and the token stored there
to authenticate. Refer to [Managing Variables](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/variables/managing-variables) documentation for more details.

## Features

- Manages configuration and life-cycle of Terraform Cloud resources:
  - projects
  - workspaces
  - teams
  - variable sets
  - variables

## Prerequisite

In order to be able to deploy the configuration from that code, you must first [create an organization](https://app.terraform.io/app/organizations/new). Because this code is designed to be used from a dedicated VCS-Driven Terraform Cloud workspace, you must [create a workspace](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/creating) manually. To get authenticated in Terraform Cloud when deploying the configuration, an
[API token](https://developer.hashicorp.com/terraform/cloud-docs/users-teams-organizations/api-tokens) must be created. This token needs to come from an account with `owner` permissions, or from the `owner` team. A `TFE_TOKEN` environment [variable](https://developer.hashicorp.com/terraform/cloud-docs/workspaces/variables/managing-variables) must be created in the previously created workspace with the value of the generated token.

## Documentation

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (> 1.3.1)

- <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) (0.48.0)

## Modules

The following Modules are called:

### <a name="module_notifications"></a> [notifications](#module\_notifications)

Source: ./modules/notification

Version:

### <a name="module_teams"></a> [teams](#module\_teams)

Source: ./modules/team

Version:

### <a name="module_workspaces"></a> [workspaces](#module\_workspaces)

Source: ./modules/workspace

Version:

## Required Inputs

No required inputs.

## Optional Inputs

No optional inputs.

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
- [tfe_oauth_client.client](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/data-sources/oauth_client) (data source)
- [tfe_organization.this](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/data-sources/organization) (data source)

## Outputs

No outputs.

<!-- markdownlint-enable -->

<!-- END_TF_DOCS -->