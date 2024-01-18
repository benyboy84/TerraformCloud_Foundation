module "repository" {
  source = "./modules/github_repository"

  for_each = nonsensitive({ for workspace in local.workspaces : workspace.name => workspace })

  name                        = each.value.name
  description                 = try(each.value.description, null)
  homepage_url                = try(each.value.github_repository.homepage_url, null)
  visibility                  = try(each.value.github_repository.visibility, "public")
  has_issues                  = try(each.value.github_repository.has_issues, true)
  has_discussions             = try(each.value.github_repository.has_discussions, false)
  has_projects                = try(each.value.github_repository.has_projects, true)
  has_wiki                    = try(each.value.github_repository.has_wiki, true)
  is_template                 = try(each.value.github_repository.is_template, false)
  allow_merge_commit          = try(each.value.github_repository.allow_merge_commit, true)
  allow_squash_merge          = try(each.value.github_repository.allow_squash_merge, true)
  allow_rebase_merge          = try(each.value.github_repository.allow_rebase_merge, true)
  allow_auto_merge            = try(each.value.github_repository.allow_auto_merge, false)
  squash_merge_commit_title   = try(each.value.github_repository.squash_merge_commit_title, "COMMIT_OR_PR_TITLE")
  squash_merge_commit_message = try(each.value.github_repository.squash_merge_commit_message, "COMMIT_MESSAGES")
  merge_commit_title          = try(each.value.github_repository.merge_commit_title, "MERGE_MESSAGE")
  merge_commit_message        = try(each.value.github_repository.merge_commit_message, "PR_TITLE")
  delete_branch_on_merge      = try(each.value.github_repository.delete_branch_on_merge, true)
  auto_init                   = try(each.value.github_repository.auto_init, false)
  gitignore_template          = try(each.value.github_repository.gitignore_template, null)
  license_template            = try(each.value.github_repository.license_template, null)
  archived                    = try(each.value.github_repository.archived, false)
  archive_on_destroy          = try(each.value.github_repository.archive_on_destroy, false)
  pages                       = try(each.value.github_repository.pages, null)
  security_and_analysis = {
    advanced_security = {
      status = try(each.value.github_repository.security_and_analysis.advanced_security.status, "enabled")
    }
    secret_scanning = {
      status = try(each.value.github_repository.security_and_analysis.secret_scanning.status, "enabled")
    }
    secret_scanning_push_protection = {
      status = try(each.value.github_repository.security_and_analysis.secret_scanning_push_protection.status, "enabled")
    }
  }
  topics                                  = try(each.value.github_repository.topics, [])
  template                                = try(each.value.github_repository.template, null)
  vulnerability_alerts                    = try(each.value.github_repository.vulnerability_alerts, true)
  ignore_vulnerability_alerts_during_read = try(each.value.github_repository.ignore_vulnerability_alerts_during_read, false)
  allow_update_branch                     = try(each.value.github_repository.allow_update_branch, false)
  branch                                  = try(each.value.github_repository.branch, "main")
  enforce_admins                          = try(each.value.github_repository.enforce_admins, true)
  require_signed_commits                  = try(each.value.github_repository.require_signed_commits, false)
  require_conversation_resolution         = try(each.value.github_repository.require_conversation_resolution, true)
  required_status_checks                  = try(each.value.github_repository.required_status_checks, null)
  required_pull_request_reviews = {
    dismiss_stale_reviews           = try(each.value.github_repository.required_pull_request_reviews.dismiss_stale_reviews, true)
    dismissal_users                 = try(each.value.github_repository.required_pull_request_reviews.dismissal_users, null)
    dismissal_teams                 = try(each.value.github_repository.required_pull_request_reviews.dismissal_teams, null)
    dismissal_apps                  = try(each.value.github_repository.required_pull_request_reviews.dismissal_apps, null)
    require_code_owner_reviews      = try(each.value.github_repository.required_pull_request_reviews.require_code_owner_reviews, true)
    required_approving_review_count = try(each.value.github_repository.required_pull_request_reviews.required_approving_review_count, "0")
    bypass_pull_request_allowances  = try(each.value.github_repository.required_pull_request_reviews.bypass_pull_request_allowances, null)
  }
  restrictions = try(each.value.github_repository.restrictions, null)

}
