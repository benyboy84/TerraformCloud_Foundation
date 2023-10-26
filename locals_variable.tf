locals {

  # The following locals use logic to determine the variable associated to a variable sets excluding any TFE_TOKEN variable.
  variable_sets_variables = flatten([for variable_set in local.variable_sets :
    flatten([for variable_key, variable in variable_set.variables :
      merge(
        variable,
        {
          key          = variable_key
          variable_set = variable_set.name
        }
      ) if variable_key != "TFE_TOKEN"
    ])
    if try(variable_set.variables, null) != null
  ])

  # The following locals use logic to determine TFE_TOKEN variable associated to a variable sets.
  variable_sets_variables_tfe_token = flatten([for variable_set in local.variable_sets :
    flatten([for variable_key, variable in variable_set.variables :
      merge(
        variable,
        {
          key          = variable_key
          variable_set = variable_set.name
        }
      ) if variable_key == "TFE_TOKEN"
    ])
    if try(variable_set.variables, null) != null
  ])

  # The following locals use logic to determine the variable associated to a workspace excluding any TFE_TOKEN variable.
  workspace_variables = flatten([for project_key, project in local.projects :
    flatten([for workspace_key, workspace in project.workspaces :
      flatten([for variable_key, variable in workspace.variables :
        merge(
          variable,
          {
            key       = variable_key
            workspace = workspace_key
          }
        ) if variable_key != "TFE_TOKEN"
      ])
      if try(workspace.variables, null) != null
    ])
    if try(project.workspaces, null) != null 
  ])

   # The following locals use logic to determine TFE_TOKEN variable associated to a workspace.
  workspace_variables_tfe_token = flatten([for project_key, project in local.projects :
    flatten([for workspace_key, workspace in project.workspaces :
      flatten([for variable_key, variable in workspace.variables :
        merge(
          variable,
          {
            key       = variable_key
            workspace = workspace_key
          }
        ) if variable_key == "TFE_TOKEN"
      ])
      if try(workspace.variables, null) != null
    ])
    if try(project.workspaces, null) != null 
  ])

}