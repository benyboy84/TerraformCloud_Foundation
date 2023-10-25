locals {

  # This is to merge all variable_set.
  variable_sets = merge(local.organization_variable_sets)

  # The following locals use logic to determine the project associate with each variable sets at the organization level.
  organization_variable_sets_project = flatten([for key, variable_set in local.variable_sets : 
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

}