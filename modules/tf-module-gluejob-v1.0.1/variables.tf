variable "glue_job_configurations" {
  description = "List of job configurations for multiple Glue jobs"
  type = list(object({
    glue_job_name_suffix     = string
    glue_role_arn            = string
    script_location          = string
    glue_job_version         = string
    glue_job_python_version  = string
    glue_connections         = list(string)
    job_parameters           = list(object({
      name                   = string
      value                  = string
    }))
  }))
  default = [
    {
      glue_job_name_suffix   = null
      glue_role_arn          = null
      script_location        = null
      glue_job_version       = "4.0"
      glue_job_python_version= "3"
      glue_connections   = [null]
      job_parameters   = [
        {
          name  = "--SRC_DB"
          value = null
        },
        {
          name  = "--SRC_TABLE"
          value = null
        },
        {
          name  = "--DEST_DB"
          value = null
        },
        {
          name  = "--DEST_TABLE"
          value = null
        },
        {
          name  = "--SRC_CONNECTION"
          value = null
        },
        {
          name  = "--DEST_CONNECTION"
          value = null
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

variable "glue_additional_tags" {
  type = map(string)
  default     = {}
  description = "Any addtional tags to be applied for Glue. Format should be {key1=value1,key2=value2}"
}


