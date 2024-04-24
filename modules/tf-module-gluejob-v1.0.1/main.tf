# Naming convention module for Glue
module "naming-glue" {
  source              = "git::https://github.com/rpavenk/AWS_Glue_Terragrunt.git/modules//tf-module-01standardnaming-v1.0.1.git"
  environment         = var.environment
  account             = var.account
  project_code            = var.project_code
  creator             = var.creator
  owner               = var.owner
  number              = var.number
  tf_state_bucket     = var.tf_state_bucket
  tf_state_key        = var.tf_state_key
  tf_stack_repository = var.tf_stack_repository
  map_migrated        = var.map_migrated
  map_migrated_app    = var.map_migrated_app
  custom_billing      = var.custom_billing
}

# Local variables
locals {
  glue_tags = merge(module.naming-glue.rv_standard_tags, var.glue_additional_tags)
}

resource "aws_glue_job" "glue_job" {
  
  for_each   = { for idx, config in var.glue_job_configurations : idx => config }

  name          = "${module.naming-glue.rv_glue_job_name}_${each.value.glue_job_name_suffix}"
  description   = "Glue job for ${module.naming-glue.rv_glue_crawler_name}_${each.value.glue_job_name_suffix}"
  tags          = local.glue_tags
  glue_version  = each.value.glue_job_version
  role_arn      = each.value.glue_role_arn
  connections   = each.value.glue_connections
  command {
    script_location = each.value.script_location
    python_version  = each.value.glue_job_python_version
  }

  default_arguments = merge(
    { for arg in each.value.job_parameters : arg.name => arg.value }
  )
}
