# The following blick is used to get information about workspace
data "tfe_workspace" "this" {
  for_each = local.remote_state_consumer_ids

  name         = each.key
  organization = data.tfe_organization.this.name
}