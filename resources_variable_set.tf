# The following code block is used to create variable sets resources.

resource "tfe_variable_set" "this" {
for_each = local.variable_sets

  name         = each.key
  description  = try(each.value.description,null)
  global       = try(each.value.global,null)
  organization = data.tfe_organization.this.name

  lifecycle {
    precondition {
      condition     = var.global ? var.workspaces == null && var.projects == null ? true : false : true
      error_message = "`global` cannot be set to true if `workspaces` or `projects` is defined."
    }
  }
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