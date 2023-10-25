locals {

  # This is to merge all variable_set.
  variable_sets = merge(local.organization_variable_sets)

}