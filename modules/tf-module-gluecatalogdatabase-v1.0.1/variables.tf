variable "glue_additional_tags" {
  type = map(string)
  default     = {}
  description = "Any addtional tags to be applied for Glue. Format should be {key1=value1,key2=value2}"
}

variable "enable_glue_catalog_database" {
  description = "Enable glue connection usage"
  default     = false
}

variable "glue_catalog_databases" {
  description = "List of glue catalog databases to create"
  type        = list(object({
    glue_database_name_suffix            = string
    glue_catalog_database_location_uri   = string
  }))
  default = [
    {
      glue_database_name_suffix          = null
      glue_catalog_database_location_uri = "/"
    }
  ]
}

variable "account" {
  type        = string
  description = "Acount, e.g 'test' ..."
}

variable "region" {
  type        = string
  description = "AWS region used to deploy your resources"
}

variable "profile" {
  type        = string
  description = "AWS Profile used to deploy your resources"
}

variable "project_code" {
  type        = string
  description = "rv Project code"
}

variable "environment" {
  type        = string
  description = "Environment: 'dv', 'in', 'ut', 'pp', 'pr'"
}

variable "tf_state_bucket" {
  type = string
  description = "A terraform backend state bucket name"
}

variable "tf_state_key"  {
  type = string
  description = "A terraform backend state bucket unique key"
}

variable "tf_stack_repository" {
  type        = string
  default     = ""
  description = "The git path of the project stack (will compose rv:source_creation)"
}

variable "creator" {
  type = string
  description  = "ldap name of creator of the resource"
}

variable "owner" {
  type = string
  description  = "ldap name of owner of the project or resource"
}

variable "custom_billing" {
  type = list(object({
    project_code    = string
    environment = string
  }))
  default     = []
  description = "A list"
}

variable "map_migrated" {
  type        = string
  default     = null
  description = "Unique Id"
}

variable "map_migrated_app" {
  type        = string
  default     = null
  description = "testCODE"
}

variable "number" {
  type        = string
  description = "Incremental number, e.g. '1, '2', '3' ..."
}

