# TFC variable sets Terraform module

Terraform variable sets module which manages configuration and life-cycle 
of all your Terraform Cloud variable sets. It is designed to be used from 
a dedicated Terraform Cloud workspace that would provision and manage 
rest of your teams using Terraform code (IaC).

## Permissions

To manage the variable sets resources, provide a user token from an account with 
appropriate permissions. 

This user should belong to the `owners` team. Alternatively, you can use an 
organization or team token instead of a user token. Otherwise, This user should 
belong to a team with `manage workspace organization access`. Alternatively, you 
can use an team token instead of a user token.

## Authentication

The Terraform Cloud provider requires a Terraform Cloud/Enterprise API token in 
order to manage resources.

There are several ways to provide the required token:

- Set the `token` argument in the provider configuration. You can set the token argument in the provider configuration. Use an
input variable for the token.
- Set the `TFE_TOKEN` environment variable: The provider can read the TFE_TOKEN environment variable and the token stored there
to authenticate.

## Features

- Create variables.
- Create variable set.
- Associate a variable set to a project.
- Associate a varrable set to a workspace.

## Usage example
```hcl
module "team" {
  source = "./modules/variable_set"

  name         = "Variable_set Name"
  organization = "Organization Name"
  projects     = ["Project Name"]
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_tfe"></a> [tfe](#requirement\_tfe) (0.48.0)

## Providers

The following providers are used by this module:

- <a name="provider_tfe"></a> [tfe](#provider\_tfe) (0.48.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [tfe_project_variable_set.this](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/resources/project_variable_set) (resource)
- [tfe_variable_set.this](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/resources/variable_set) (resource)
- [tfe_workspace_variable_set.this](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/resources/workspace_variable_set) (resource)
- [tfe_project.this](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/data-sources/project) (data source)
- [tfe_workspace.this](https://registry.terraform.io/providers/hashicorp/tfe/0.48.0/docs/data-sources/workspace) (data source)

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_description"></a> [description](#input\_description)

Description: (Optional) Description of the variable set.

Type: `string`

Default: `null`

### <a name="input_global"></a> [global](#input\_global)

Description: (Optional) Whether or not the variable set applies to all workspaces in the organization.

Type: `bool`

Default: `false`

### <a name="input_name"></a> [name](#input\_name)

Description: (Optional) Name of the variable set.

Type: `string`

Default: `null`

### <a name="input_organization"></a> [organization](#input\_organization)

Description: (Optional) Name of the organization. If omitted, organization must be defined in the provider config.

Type: `string`

Default: `null`

### <a name="input_projects"></a> [projects](#input\_projects)

Description: (Optional) Project name to add the variable set to.

Type: `list(string)`

Default: `null`

### <a name="input_workspaces"></a> [workspaces](#input\_workspaces)

Description: (Optional) Workspace name to add the variable set to.

Type: `list(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_project_variable_set_attachment"></a> [project\_variable\_set\_attachment](#output\_project\_variable\_set\_attachment)

Description: Terraform Cloud project\_variable\_set resource.

### <a name="output_project_variable_set_attachment_id"></a> [project\_variable\_set\_attachment\_id](#output\_project\_variable\_set\_attachment\_id)

Description: The ID of the variable set attachment. ID format: `<project-id>_<variable-set-id>`

### <a name="output_variable_set"></a> [variable\_set](#output\_variable\_set)

Description: Terraform Cloud variable\_set resource.

### <a name="output_variable_set_id"></a> [variable\_set\_id](#output\_variable\_set\_id)

Description: The ID of the variable set.

### <a name="output_workspace_variable_set_attachment"></a> [workspace\_variable\_set\_attachment](#output\_workspace\_variable\_set\_attachment)

Description: Terraform Cloud workspace\_variable\_set resource.

### <a name="output_workspace_variable_set_attachment_id"></a> [workspace\_variable\_set\_attachment\_id](#output\_workspace\_variable\_set\_attachment\_id)

Description: The ID of the variable set attachment. ID format: `<workspace-id>_<variable-set-id>`
<!-- END_TF_DOCS -->