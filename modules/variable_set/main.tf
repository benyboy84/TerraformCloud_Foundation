resource "tfe_variable_set" "this" {
  name         = var.name
  description  = var.description
  global       = var.global
  organization = var.organization

  lifecycle {
    precondition {
      condition     = var.global ? var.workspaces == null && var.projects == null ? true : false : true
      error_message = "`global` cannot be set to true if `workspaces` or `projects` is defined."
    }
  }
}

resource "tfe_workspace_variable_set" "this" {
  for_each = { for workspace in flatten(local.workspaces) : "${workspace.name}" => workspace }

  variable_set_id = tfe_variable_set.this.id
  workspace_id    = each.value.id
}

resource "tfe_project_variable_set" "this" {
  for_each = { for project in flatten(local.projects) : "${project.name}" => project }

  variable_set_id = tfe_variable_set.this.id
  project_id      = each.value.id
}