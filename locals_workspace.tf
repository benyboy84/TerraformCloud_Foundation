locals {

  # The following locals use logic to determine the project associate with each workspace.
  workspaces = flatten([for projects, project in local.projects :
    flatten([for workspaces, workspace in project.workspaces :
      merge(
        workspace,
        { name = workspaces
        project = projects }
      )
    ])
    if try(project.workspaces, null) != null
  ])

}