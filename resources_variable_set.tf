# The following code block is used to create variable sets resources.

resource "tfe_variable_set" "this" {
  for_each = local.variable_sets

  name         = each.key
  description  = try(each.value.description, null)
  global       = try(each.value.global, null)
  organization = data.tfe_organization.this.name

  lifecycle {
    precondition {
      condition     = try(each.value.global, false) ? try(each.value.workspaces, null) == null && try(each.value.projects, null) == null ? true : false : true
      error_message = "`global` cannot be set to true if `workspaces` or `projects` is defined."
    }
  }
}

resource "tfe_project_variable_set" "this" {
  for_each = flatten([
    for key, variable_set in local.variable_sets : {
      for project in flatten(variable_set.projects) : 
      "${key}_${project}" => merge(variable_set,
        {
          name    = key
          project = project
        }
      )
    }
    if try(variable_set.projects, null) != null
  ])

  variable_set_id = tfe_variable_set.this["${each.name}"].id
  project_id      = tfe_project.project["${project}"].id
}

# module "variable_set" {
#   source = "./modules/variable_set"

#   for_each = local.variable_sets

#   name         = each.key
#   description  = try(each.value.description, null)
#   global       = try(each.value.global, null)
#   organization = data.tfe_organization.this.name
#   workspaces = try(
#     flatten([for workspace in flatten(each.value.workspaces) : {
#       name = workspace
#       id   = try(module.workspaces["${workspace}"].id, null)
#   }]), null)
#   projects = try(
#     [for project in flatten(each.value.projects) : {
#       name = project
#       id   = try(module.workspaces["${project}"].id, null)
#   }], null)

# }