variable "enable_glue_connection" {
  description = "Enable glue connection usage"
  default     = false
}

variable "glue_connection_name_suffix" {
  description = "Suffix for glue connection name default naming convention"
  type        = string
  default     = null
}

variable "vpc_id" {
  type        = string
  default     = ""
  description = "vpc id for the network configuration of glue connection for RDS datasource"
}

variable "glue_additional_tags" {
  type = map(string)
  default     = {}
  description = "Any addtional tags to be applied for Glue. Format should be {key1=value1,key2=value2}"
}

variable "glue_connections" {
  description = "List of glue connections to create"
  type        = list(object({
    glue_connection_name_suffix   = string
    glue_connection_type          = string
    connection_url                = string
    connection_secret_name        = string
    availability_zone             = string
    sg_ids                        = list(string)
    subnet_id                     = string
  }))
  default = [
    {
      glue_connection_name_suffix   = null
      glue_connection_type          = "JDBC"
      connection_url                = null
      connection_secret_name        = null
      availability_zone             = null
      sg_ids                        = [null]
      subnet_id                     = null
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
  description = "A list of ([project_code],[environment]) for custom billing purpose, i.e. where billing is not the same than naming (mainly for shared resources)."
}

variable "map_migrated" {
  type        = string
  default     = null
  description = "Unique Id provided by AWS migration Hub for the AWS MAP programm"
}

variable "map_migrated_app" {
  type        = string
  default     = null
  description = "testCODE for the application creating the RDS instance, as required by AWS MAP Programme"
}

variable "number" {
  type        = string
  description = "Incremental number, e.g. '1, '2', '3' ..."
}


