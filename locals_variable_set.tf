locals {

  # The following locals use logic to determine the variable sets at project level.
  project_level_variable_sets_tuple = flatten([for project_key, project in local.projects :
    flatten([for variable_set_key, variable_set in project.variable_sets :
      merge(
        variable_set,
        {
          name    = variable_set_key
          project = project_key
        }
      )
    ])
    if try(project.variable_sets, null) != null
  ])
  project_level_variable_sets = { for object in local.project_level_variable_sets_tuple : "Project ${object.name} ${object.project}" => object }

  # The following locals use logic to determine the workspace associate with each variable sets at the project level.
  project_level_workspace_variable_sets_tuple = flatten([for project_key, project in local.projects :
    flatten([for variable_set_key, variable_set in project.variable_sets :
      flatten([for workspace in flatten(variable_set.workspaces) :
        merge(
          variable_set,
          {
            name      = variable_set_key
            workspace = workspace
          }
        )
      ])
      if try(variable_set.workspaces, null) != null
    ])
    if try(project.variable_sets, null) != null
  ])
  project_level_workspace_variable_sets = { for object in local.project_level_workspace_variable_sets_tuple : "Project ${object.name} ${object.project} ${object.workspace}" => object }

  # The following locals use logic to determine the variable sets at workspace level.
  workspace_level_variable_sets_tuple = flatten([for project_key, project in local.projects :
    flatten([for workspace_key, workspace in project.workspaces :
      flatten([for variable_set_key, variable_set in workspace.variable_sets :
        merge(
          variable_set,
          {
            name      = variable_set_key
            workspace = workspace_key
          }
        )
      ])
      if try(workspace.variable_sets, null) != null
    ])
    if try(project.workspaces, null) != null
  ])
  workspace_level_variable_sets = { for object in local.workspace_level_variable_sets_tuple : "Workspace ${object.name} ${object.workspace}" => object }

  # The following locals use logic to determine the project associate with each variable sets at the organization level.
  organization_level_project_variable_sets_tuple = flatten([for key, variable_set in local.variable_sets :
    flatten([for project in flatten(variable_set.projects) :
      merge(variable_set,
        {
          name    = key
          project = project
        }
      )
    ])
    if try(variable_set.projects, null) != null
  ])
  organization_level_project_variable_sets_project = { for object in local.organization_level_project_variable_sets_project_tuple : "Organization ${object.name} ${object.project}" => object }

  # The following locals use logic to determine the workspace associate with each variable sets at the organization level.
  organization_level_variable_sets_workspace_tuple = flatten([for key, variable_set in local.variable_sets :
    flatten([for workspace in flatten(variable_set.workspaces) :
      merge(variable_set,
        {
          name      = key
          workspace = workspace
        }
      )
    ])
    if try(variable_set.workspaces, null) != null
  ])
  organization_level_variable_sets_workspace = { for object in local.organization_level_variable_sets_workspace_tuple : "Organization ${object.name} ${object.workspace}" => object }

  # This is to merge all variable sets.
  variable_sets = merge(
    local.organization_variable_sets,
    local.project_level_variable_sets,
    local.project_level_workspace_variable_sets,
    local.workspace_level_variable_sets
  )

  # This is to merge all variable sets associate with project.
  project_variable_sets = merge(
    local.organization_level_project_variable_sets,
    local.project_level_variable_sets
  )

  # This is to merge all variable sets associate with workspace.
  workspace_variable_sets = merge(
    local.organization_level_variable_sets_workspace,
    local.workspace_level_variable_sets,
    local.project_level_workspace_variable_sets
  )



}