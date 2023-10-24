variable "name" {
  description = "(Optional) Name of the variable set."
  type        = string
  default     = null
}

variable "description" {
  description = "(Optional) Description of the variable set."
  type        = string
  default     = null
}

variable "global" {
  description = "(Optional) Whether or not the variable set applies to all workspaces in the organization."
  type        = bool
  default     = false
}

variable "organization" {
  description = "(Optional) Name of the organization. If omitted, organization must be defined in the provider config."
  type        = string
  default     = null
}

variable "workspace_name" {
  description = "(Optional) Workspace name to add the variable set to."
  type        = list(string)
  default     = null
}

variable "project_name" {
  description = "(Optional) Project name to add the variable set to."
  type        = list(string)
  default     = null
}