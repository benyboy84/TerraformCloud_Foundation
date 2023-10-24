output "variable_set_id" {
  description = "The ID of the variable set."
  value       = tfe_variable_set.this.id
}

output "variable_set" {
  description = "Terraform Cloud variable_set resource."
  value       = tfe_variable_set.this
}

output "workspace_variable_set_attachment_id" {
  description = "The ID of the variable set attachment. ID format: `<workspace-id>_<variable-set-id>`"
  value = {
    for k, v in tfe_workspace_variable_set.this : k => v.id
  }
}

output "workspace_variable_set_attachment" {
  description = "Terraform Cloud workspace_variable_set resource."
  value = {
    for k, v in tfe_workspace_variable_set.this : k => v
  }
}

output "project_variable_set_attachment_id" {
  description = "The ID of the variable set attachment. ID format: `<project-id>_<variable-set-id>`"
  value = {
    for k, v in tfe_project_variable_set.this : k => v.id
  }
}

output "project_variable_set_attachment" {
  description = "Terraform Cloud project_variable_set resource."
  value = {
    for k, v in tfe_project_variable_set.this : k => v
  }
}