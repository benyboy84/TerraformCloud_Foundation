locals {
  # This local is used to define the organization name.
  organization_name = "ConseilsTI"

  # This local is used to define Oauth_client name.
  # oauth_client_name = "GitHub.com"

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
    "org_private-registry" = {
      sso_team_id = "a1f6c183-1350-4298-9266-b1ba00c66372"
      token       = true
      organization_access = {
        manage_modules = true
      }
    },
    "org_membership" = {
      sso_team_id = "88b38c9b-755d-4193-b89a-94cb9c5de56b"
      token       = true
      organization_access = {
        manage_membership = true
      }
    }
    "org_default" = {
      organization_access = {
      }
    }
  }

  projects = {
    "Azure Landing Zone" = {}
    "AWS Landing Zone"   = {}
    "Terraform Cloud"    = {}
  }

}
