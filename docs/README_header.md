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

- Set the `TFE_TOKEN` environment variable: The provider can read the TFE_TOKEN environment variable and the token stored there
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
