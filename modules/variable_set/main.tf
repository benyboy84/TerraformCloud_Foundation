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

data "tfe_workspace" "this" {
  for_each = var.workspaces != null ? toset(var.workspaces) : []

  name         = each.value
  organization = var.organization
}

resource "tfe_workspace_variable_set" "this" {
  for_each = var.workspaces != null ? toset(var.workspaces) : []

  variable_set_id = tfe_variable_set.this.id
  workspace_id    = data.tfe_workspace.this["${each.value}"].id
}

data "tfe_project" "this" {
  for_each = var.projects != null ? toset(var.projects) : []

  name         = each.value
  organization = var.organization
}

resource "tfe_project_variable_set" "this" {
  for_each = var.projects != null ? toset(var.projects) : []

  variable_set_id = tfe_variable_set.this.id
  project_id      = data.tfe_project.this["${each.value}"].id
}