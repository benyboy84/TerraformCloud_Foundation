locals {
  # This local is used to define the organization name.
  organization_name = "ConseilsTI"

  # This local is used to define Oauth_client name.
  oauth_client_name = "GitHub.com"

  # This local is used to define teams at the organization level.
  organization_teams = {
    # `organization_teams` is a map of object where the key is the name of the team.
    # Each object must contain an `organization_access` argument with the team's organization access.
    # Refer to "./modules/team/README.md" for more details on the permissions type.
    # Here is an example of an object:
    # "team_name" = {
    #   members = []
    #   organization_access = {
    #     read_projects           = true or false
    #     manage_projects         = true or false
    #     read_workspaces         = true or false
    #     manage_workspaces       = true or false
    #     manage_policies         = true or false
    #     manage_policy_overrides = true or false
    #     manage_run_tasks        = true or false
    #     manage_vcs_settings     = true or false
    #     manage_membership       = true or false
    #     manage_modules          = true or false
    #     manage_providers        = true or false
    #   }
    #   sso_team_id            = ""
    #   token                  = true or false
    #   token_expired_at       = ""
    #   token_force_regenerate = true or false
    #   visibility             = "secret" or "organization"
    # }
    "org_admin" = {
      sso_team_id = "a2f4919a-4c3c-436a-a010-fde47b98d0fd"
      token       = true
      organization_access = {
        manage_projects         = true
        manage_workspaces       = true
        manage_policies         = true
        manage_policy_overrides = true
        manage_run_tasks        = true
        manage_vcs_settings     = true
        manage_membership       = true
        manage_modules          = true
        manage_providers        = true
      }
    },
  }

  # This local is used to define variable_set at the organization level.
  organization_variable_sets = {
    # `organization_variable_sets` is a map of object where the key is the name of the variable_set.
    # Here is an example of an object:
    # "name" = {
    #   description = ""
    #   global      = true or false *Cannot be set to true if `workspaces` or ``projects` are defined.*
    #   projects    = [""]
    #   variables = {
    #     variable_name = {
    #       value     = ""
    #       category  = "terraform" or "env"
    #       sensitive = true or false
    #     }
    #   }
    #   workspaces  = [""]
    # }
  }

  # This local is used to define all resrouces required to deploy IaC in Terraform Cloud. 
  projects = {
    # `projects` is a map of object where the key is the name of the project.
    # Each project can contain all required object like teams, variable sets, workspaces, variables...
    # Refer to "./modules/workspace/README.md" for more details on the workspace properties.
    # Refer to "./modules/team/README.md" for more details on the permissions type.
    # Refer to "./modules/notification/README.md" for more details on the notification configuration.
    # Here is an example of an object:
    # "project_name" = {
    #   teams = {
    #     "team_name" = {
    #       custom_workspace_access = {
    #         runs           = "read", "plan", or "apply"
    #         sentinel_mocks = "none", or "read"
    #         state_versions = "none", "read-outputs", "read", or "write"
    #         variables      = "none", "read", or "write"
    #         create         = true or false
    #         locking        = true or false
    #         delete         = true or false
    #         move           = true or false
    #         run_tasks      = true or false
    #       }
    #       members = []
    #       sso_team_id            = ""
    #       token                  = true or false
    #       token_expired_at       = ""
    #       token_force_regenerate = true or false
    #       visibility             = "secret" or "organization"
    #     }
    #   }
    #   variable_set = {
    #     "name" = {
    #       description = ""
    #       global      = false *Cannot be set to true.*
    #       variables = {
    #         variable_name = {
    #           value     = ""
    #           category  = "terraform" or "env"
    #           sensitive = true or false
    #         }
    #       }
    #       workspaces  = [""]
    #     }
    #   }
    #   workspaces = {
    #     "workspace_name" = {
    #       notifications = {
    #         "notification_name" = {
    #           destination_type = "generic", "email", "email", or "microsoft-teams"
    #           triggers         = ["run:created", "run:planning", "run:needs_attention", "run:applying", "run:completed", "run:errored", "assessment:check_failure", "assessment:drifted", "assessment:failed"]
    #           url              = "Url
    #         }
    #       }
    #       teams = {
    #         "team_name" = {
    #           workspace_permission = {
    #             runs              = "read", "plan", or "apply"
    #             variables         = "none", "read", or "write"
    #             state_versions    = "none", "read", "read-outputs", or "write"
    #             sentinel_mocks    = "none" or "read"
    #             workspace_locking = true or false
    #             run_tasks         = true or false
    #           }
    #           members = []
    #           sso_team_id            = ""
    #           token                  = true or false
    #           token_expired_at       = ""
    #           token_force_regenerate = true or false
    #           visibility             = "secret" or "organization"
    #         }
    #       }
    #       variables = {
    #         "variable_name" = {
    #           value     = ""
    #           category  = "terraform" or "env"
    #           sensitive = true or false
    #         }
    #       }
    #       variable_set = {
    #         "variable_set_name" = {
    #           description = ""
    #           global      = false *Cannot be set to true.*
    #           variables = {
    #             "variable_name" = {
    #               value     = ""
    #               category  = "terraform" or "env"
    #               sensitive = true or false
    #             }
    #           }
    #         }
    #       vcs_repo = {
    #         identifier     = "GitHub repository"
    #         oauth_token_id = data.tfe_oauth_client.client.oauth_token_id
    #       }  
    #     }
    #     "workspace_name" = {
    #       execution_mode = "local"
    #     }
    #   }
    # }
    "Azure Landing Zone" = {}
    "AWS Landing Zone"   = {}
    "Terraform Cloud" = {
      workspaces = {
        "TerraformCloud_ModulesRegistry" = {
          notifications = {
            "MS_TEAM" = {
              destination_type = "microsoft-teams"
              triggers         = ["run:created", "run:planning", "run:needs_attention", "run:applying", "run:completed", "run:errored", "assessment:check_failure", "assessment:drifted", "assessment:failed"]
              url              = "https://conseilsti.webhook.office.com/webhookb2/b1967add-a0bb-4f55-9508-280cefef4403@0f9829d3-a628-4f2b-a3ac-58e0740d27ae/IncomingWebhook/bd56b2570de84870b0529487428b9ccb/4c88f00c-bcb7-4867-823f-ce6d94fb1c06"
            }
          }
          tag_names = ["managed_by_terraform"]
          teams = {
            "private-registry" = {
              sso_team_id = "a1f6c183-1350-4298-9266-b1ba00c66372"
              token       = true
              organization_access = {
                manage_modules = true
              }
              workspace_permission = {
                runs              = "apply"
              }
            }          
          }
          vcs_repo = {
            identifier     = "benyboy84/TerraformCloud_ModulesRegistry"
            oauth_token_id = data.tfe_oauth_client.client.oauth_token_id
          }
          variables = {
            "TFE_TOKEN" = {
              value     = "terraformcloud_modulesregistry_private_registry"
              category  = "env"
              sensitive = true
            }
          }
        }
      }
    }
  }

}