# The following code block is used to create variable sets resources.

module "variable_set" {
  source = "./modules/variable_set"

  for_each = local.variable_sets

  name         = each.key
  description  = try(each.value.description, null)
  global       = try(each.value.global, null)
  organization = data.tfe_organization.this.name
  workspaces   = try(each.value.workspaces, null)
  projects     = try(each.value.projects, null)

}