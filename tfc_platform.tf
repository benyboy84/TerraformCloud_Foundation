locals {
  # This local is used to define all required workspaces to deploy. 
  tfc_platform_workspaces = {
    "TerraformCloud-ModulesRegistry" = {
      description      = "Repository to provision and manage Terraform Cloud modules registry using Terraform code (IaC)."
      tag_names        = ["managed_by_terraform"]
      trigger_patterns = ["*.tf"]
      vcs_repo = {
        identifier     = "benyboy84/TerraformCloud-ModulesRegistry"
        oauth_token_id = data.tfe_oauth_client.client.oauth_token_id
      }
    }
    "TerraformCloud-Policies" = {
      description = "Repository to provision and manage Terraform Cloud policies using Terraform code (IaC)."
      github_repository = {
        secrets = [
          {
            secret_name     = "TFC_API_TOKEN"
            plaintext_value = "terraformcloud-policies-manage-policies"
          }
        ]
      }
      tag_names        = ["managed_by_terraform"]
      trigger_patterns = ["*.tf", "*.sentinel"]
      vcs_repo = {
        identifier     = "benyboy84/TerraformCloud-Policies"
        oauth_token_id = data.tfe_oauth_client.client.oauth_token_id
      }
    }
  }

  # This local is used to define all required teams to deploy.
  tfc_platform_teams = {
    "manage-modules" = {
      organization_access = {
        manage_modules = true
      }
      sso_team_id    = "a1f6c183-1350-4298-9266-b1ba00c66372"
      token          = true
      workspace_name = "TerraformCloud-ModulesRegistry"
      workspace_permission = {
        runs = "apply"
      }
    }
    "manage-policies" = {
      organization_access = {
        manage_policies = true
      }
      sso_team_id    = "045981aa-f630-44c4-88fe-a0b992a2a94e"
      token          = true
      workspace_name = "TerraformCloud-Policies"
      workspace_permission = {
        runs = "apply"
      }
    }
  }
}


# The following resource block is used to create project resources.
resource "tfe_project" "tfc_platform_project" {
  organization = data.tfe_organization.this.name
  name         = "Terraform Cloud"
}

# The following code block is used to create workspace resources in project.
module "tfc_platform_workspaces" {
  source = "./modules/tfe_workspace"

  for_each = local.tfc_platform_workspaces

  name         = each.key
  organization = data.tfe_organization.this.name
  project_id   = tfe_project.tfc_platform_project.id

  description                   = try(each.value.description, null)
  agent_pool_id                 = try(each.value.agent_pool_id, null)
  allow_destroy_plan            = try(each.value.allow_destroy_plan, null)
  auto_apply                    = try(each.value.auto_apply, null)
  execution_mode                = try(each.value.execution_mode, null)
  assessments_enabled           = try(each.value.assessments_enabled, null)
  file_triggers_enabled         = try(each.value.file_triggers_enabled, null)
  global_remote_state           = try(each.value.global_remote_state, null)
  remote_state_consumer_ids     = try([for value in each.value.remote_state_consumer_ids : data.tfe_workspace.this[value].id], null)
  queue_all_runs                = try(each.value.queue_all_runs, null)
  source_name                   = try(each.value.source_name, null)
  source_url                    = try(each.value.source_url, null)
  speculative_enabled           = try(each.value.speculative_enabled, null)
  structured_run_output_enabled = try(each.value.structured_run_output_enabled, null)
  ssh_key_id                    = try(each.value.ssh_key_id, null)
  tag_names                     = try(each.value.tag_names, null)
  terraform_version             = try(each.value.terraform_version, null)
  trigger_prefixes              = try(each.value.trigger_prefixes, null)
  trigger_patterns              = try(each.value.trigger_patterns, null)
  vcs_repo                      = try(each.value.vcs_repo, null)
  working_directory             = try(each.value.working_directory, null)
}

# The following resource block is used to create team resources.
module "tfc_platform_teams" {
  source = "./modules/tfe_team"

  for_each = local.tfc_platform_teams

  name                    = each.key
  organization            = data.tfe_organization.this.name
  visibility              = try(each.value.visibility, "organization")
  sso_team_id             = try(each.value.sso_team_id, null)
  organization_access     = try(each.value.organization_access, null)
  project_name            = try(each.value.project, null)
  project_id              = try(tfe_project.project[each.value.project].id, null)
  project_access          = try(each.value.project_access, null)
  custom_project_access   = try(each.value.custom_project_access, null)
  custom_workspace_access = try(each.value.custom_workspace_access, null)
  workspace_name          = try(each.value.workspace, null)
  workspace_id            = try(module.workspaces[each.value.workspace].id, null)
  workspace_access        = try(each.value.workspace_access, null)
  workspace_permission    = try(each.value.workspace_permission, null)
  token                   = try(each.value.token, false)
  token_force_regenerate  = try(each.value.token_force_regenerate, null)
  token_expired_at        = try(each.value.token_expired_at, null)
  members                 = try(each.value.members, null)
}




# "Terraform Cloud" = {
#   workspaces = {
#     "TerraformCloud-ModulesRegistry" = {
#       description = "Repository to provision and manage Terraform Cloud modules registry using Terraform code (IaC)."
#       notifications = {
#         "Microsoft Teams" = {
#           destination_type = "microsoft-teams"
#           triggers         = ["run:created", "run:planning", "run:needs_attention", "run:applying", "run:completed", "run:errored", "assessment:check_failure", "assessment:drifted", "assessment:failed"]
#           url              = "https://conseilsti.webhook.office.com/webhookb2/b1967add-a0bb-4f55-9508-280cefef4403@0f9829d3-a628-4f2b-a3ac-58e0740d27ae/IncomingWebhook/bd56b2570de84870b0529487428b9ccb/4c88f00c-bcb7-4867-823f-ce6d94fb1c06"
#         }
#       }
#       tag_names = ["managed_by_terraform"]
#       teams = {
#         "manage-modules" = {
#           sso_team_id = "a1f6c183-1350-4298-9266-b1ba00c66372"
#           token       = true
#           organization_access = {
#             manage_modules = true
#           }
#           workspace_permission = {
#             runs = "apply"
#           }
#         }
#       }
#       trigger_patterns = ["*.tf"]
#       variables = {
#         "TFE_TOKEN" = {
#           value     = "terraformcloud-modulesregistry-manage-modules"
#           category  = "env"
#           sensitive = true
#         }
#       }
#       vcs_repo = {
#         identifier     = "benyboy84/TerraformCloud-ModulesRegistry"
#         oauth_token_id = data.tfe_oauth_client.client.oauth_token_id
#       }
#     }
#     "TerraformCloud-Policies" = {
#       description = "Repository to provision and manage Terraform Cloud policies using Terraform code (IaC)."
#       github_repository = {
#         secrets = [
#           {
#             secret_name     = "TFC_API_TOKEN"
#             plaintext_value = "terraformcloud-policies-manage-policies"
#           }
#         ]
#       }
#       notifications = {
#         "Microsoft Teams" = {
#           destination_type = "microsoft-teams"
#           triggers         = ["run:created", "run:planning", "run:needs_attention", "run:applying", "run:completed", "run:errored", "assessment:check_failure", "assessment:drifted", "assessment:failed"]
#           url              = "https://conseilsti.webhook.office.com/webhookb2/b1967add-a0bb-4f55-9508-280cefef4403@0f9829d3-a628-4f2b-a3ac-58e0740d27ae/IncomingWebhook/bd56b2570de84870b0529487428b9ccb/4c88f00c-bcb7-4867-823f-ce6d94fb1c06"
#         }
#       }
#       tag_names = ["managed_by_terraform"]
#       teams = {
#         "manage-policies" = {
#           sso_team_id = "045981aa-f630-44c4-88fe-a0b992a2a94e"
#           token       = true
#           organization_access = {
#             manage_policies = true
#           }
#           workspace_permission = {
#             runs = "apply"
#           }
#         }
#       }
#       trigger_patterns = ["*.tf", "*.sentinel"]
#       variables = {
#         "TFE_TOKEN" = {
#           value     = "terraformcloud-policies-manage-policies"
#           category  = "env"
#           sensitive = true
#         }
#       }
#       vcs_repo = {
#         identifier     = "benyboy84/TerraformCloud-Policies"
#         oauth_token_id = data.tfe_oauth_client.client.oauth_token_id
#       }
#     }