variable "account" {
  type        = string
  description = "Acount, e.g 'cis', 'cit', 'cdr', 'itc' ..."
}

variable "project_code" {
  type        = string
  description = "rv unique project code provided by test application (three digits)"
}

variable "environment" {
  type        = string
  default     = ""
  description = "Two digits describing the environment type: e.g. 'dv', 'in', 'ut', 'pp', 'pr' or 'np', 'pr'"
}

variable "specification" {
  type        = string
  default     = ""
  description = "A specification (a role, a description, a situation)'"
}

variable "number" {
  type        = string
  default     = ""
  description = "Incremental number, e.g. '1, '2', '3' ..."
}

variable "custom_billing" {
  type = list(object({
    project_code    = string
    environment = string
  }))
  default     = []
  description = "A list of ([project_code],[environment]) for custom billing purpose, i.e. where billing is not the same than naming (mainly for shared resources)."
}

variable "creator" {
  type        = string
  description = "The creator name, ex: N. Dupont"
}

variable "owner" {
  type        = string
  description = "The owner name, ex : N. Dupont"
}

variable "tf_state_bucket" {
  type        = string
  default     = ""
  description = "The s3 bucket where statefile is stored"
}

variable "tf_state_key" {
  type        = string
  default     = ""
  description = "The s3 key (=name) where statefile is stored"
}

variable "tf_stack_repository" {
  type        = string
  default     = ""
  description = "The git path of the project stack (will compose rv:source_creation)"
}

variable "tf_deploy_mode" {
  type        = string
  default     = "manual"
  validation {
    condition     = can(regex("^(ci|manual)$", var.tf_deploy_mode))
    error_message = "The tf_deploy_mode allowed values are [ci, manual]."
  }
  description = "The deploy mode of the terraform project ci/manual (will compose rv:source_creation)"
}

variable "map_migrated" {
  type        = string
  default     = ""
  description = "The optional map-migrated code refering a Migration Hub Id"
}

variable "map_migrated_app" {
  type        = string
  default     = ""
  description = "The optional map-migrated-app value refering the application migrated"
}

variable "additional_tags" {
  type        = map(string)
  default     = {}
  description = "Optional Additional tags (ex : `map('rv:comment','your custom value')`"
}
