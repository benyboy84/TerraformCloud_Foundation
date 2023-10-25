# The following code block is used to create variable sets resources.

module "variable_set" {
  source = "./modules/variable_set"

  for_each = local.variable_sets

  name         = each.key
  description  = try(each.value.description, null)
  global       = try(each.value.global, null)
  organization = data.tfe_organization.this.name
  workspaces = try(
    flatten([for workspace in flatten(each.value.workspaces) : {
      name = workspace
      id   = try(module.workspaces["${workspace}"].id, null)
  }]), null)
  projects = try(
    flatten([for project in flatten(each.value.projects) : {
      name = project
      id   = try(module.workspaces["${project}"].id, null)
  }]), null)

}