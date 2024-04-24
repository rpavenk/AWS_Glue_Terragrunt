variable "glue_additional_tags" {
  type = map(string)
  default     = {}
  description = "Any addtional tags to be applied for Glue. Format should be {key1=value1,key2=value2}"
}

variable "glue_arguments" {
  description = "Arguments to pass to the Glue Job"
  type    = map
  default = {}
}


variable "glue_trigger_configurations" {
  description = "List of trigger configurations for Glue jobs"
  type = list(object({
    glue_trigger_name_suffix= string
    trigger_type            = string
    schedule                = string
    enabled                 = bool
    actions                 = list(object({
      job_name              = string
    }))
  }))
  default = [
    {
      glue_trigger_name_suffix  = null
      trigger_type              = "SCHEDULED"
      schedule                  = "cron(0 12 * * ? *)"
      enabled                   = false
      actions = [
        {
          job_name = null
        }
      ]
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

