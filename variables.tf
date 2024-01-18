variable "github_organization" {
  description = "(Required) This is the target GitHub organization or individual user account to manage."
  type        = string
}

variable "app_id" {
  description = "(Required) This is the ID of the GitHub App used by the provider to authenticate."
  type        = string
}

variable "app_installation_id" {
  description = "(Required) This is the installation ID of the GitHub App used by the provider to authenticate."
  type        = string
}

variable "app_pem_file" {
  description = "(Required) This is the PEM file of the GitHub App used by the provider to authenticate."
  type        = string
}
