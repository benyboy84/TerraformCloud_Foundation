resource "tfe_variable_set" "this" {
  name         = var.name
  description  = var.description
  global       = var.global
  organization = var.organization

  lifecycle {
    precondition {
      condition     = var.global ? var.workspace_name == null && var.project_name == null ? true : false : true
      error_message = "`global` cannot be set to true if `workspace_name` or `project_name` is defined."
    }
  }
}

data "tfe_workspace" "this" {
  for_each = var.workspace_name != null ? toset(var.workspace_name) : []

  name         = each.value
  organization = var.organization
}

resource "tfe_workspace_variable_set" "this" {
  for_each = var.workspace_name != null ? toset(var.workspace_name) : []

  variable_set_id = tfe_variable_set.this.id
  workspace_id    = data.tfe_workspace.this["${each.value}"].id
}

data "tfe_project" "this" {
  for_each = var.project_name != null ? toset(var.project_name) : []

  name         = each.value
  organization = var.organization
}

resource "tfe_project_variable_set" "this" {
  for_each = var.project_name != null ? toset(var.project_name) : []

  variable_set_id = tfe_variable_set.this.id
  project_id      = data.tfe_project.this["${each.value}"].id
}