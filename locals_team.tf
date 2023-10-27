locals {

  # The following locals use logic to determine the teams at organization level.
  organization_level_teams = flatten([for team_key, team in local.organization_teams :
    merge(
      team,
      {
        name = team_key
      }
    )
  ])

  # The following locals use logic to determine the project associate with each team.
  project_level_teams = flatten([for projects, project in local.projects :
    flatten([for teams, team in project.teams :
      merge(
        team,
        { name           = "${lower(replace(projects, "/\\W|_|\\s/", "_"))}_${lower(teams)}"
          project        = projects
          project_access = lower(team.project_access)
        }
      )
    ])
    if try(project.teams, null) != null
  ])

  # The following locals use logic to determine the workspace associate with each team.
  workspace_level_teams = flatten([for projects, project in local.projects :
    flatten([for workspaces, workspace in project.workspaces :
      flatten([for teams, team in workspace.teams :
        merge(
          team,
          { name             = "${lower(replace(workspaces, "/\\W|_|\\s/", "_"))}_${lower(teams)}"
            workspace        = workspaces
            workspace_access = lower(team.workspace_access)
          }
        )
      ])
      if try(workspace.teams, null) != null
    ])
    if try(project.workspaces, null) != null
  ])

  # This is to concat organization teams with project teams.
  teams = concat(
    local.organization_level_teams,
    local.project_level_teams,
    local.workspace_level_teams
  )

}
