variable "enable_glue_crawler" {
  description = "Enable glue connection usage"
  default     = false
}

variable "glue_policy_statements" {
  description   = "List of iam policy statements for glue"
  type          = list(object({
    sid         = string
    effect      = string
    actions     = list(string)
    resources   = list(string)
  }))
  default = [
    {
      sid      = "AllowSecretManager"
      effect   = "Allow"
      actions  = ["secretsmanager:GetSecretValue", "secretsmanager:DescribeSecret"]
      resources= ["arn:aws:secretsmanager:*:*:secret:rds-db-credentials/*"]
    }
  ]
}

variable "glue_crawlers" {
  description                     = "List of glue crawlers to create"
  type                            = list(object({
    glue_crawler_name_suffix      = string
    glue_catalog_database_name    = string
    glue_connection_name          = string
    connection_path               = list(string)
    glue_schedule_expression      = string

  }))
  default = [
    {
      glue_crawler_name_suffix      = null
      glue_catalog_database_name    = null
      glue_connection_name          = null
      connection_path               = [null, null]
      glue_schedule_expression      = "cron(0 0 * * ? *)"
    }
  ]
}

variable "account" {
  type        = string
  description = "Acount, e.g 'cis', 'cit', 'cdr', 'itc' ..."
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

variable "glue_additional_tags" {
  type = map(string)
  default     = {}
  description = "Any addtional tags to be applied for Glue. Format should be {key1=value1,key2=value2}"
}

