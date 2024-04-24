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

resource "aws_glue_trigger" "glue_trigger" {
  for_each = { for idx, config in var.glue_trigger_configurations : idx => config }

  name       = "${module.naming-glue.rv_glue_trigger_name}_${each.value.glue_trigger_name_suffix}"
  description= "Glue trigger for ${module.naming-glue.rv_glue_crawler_name}_${each.value.glue_trigger_name_suffix}"
  tags       = local.glue_tags
  type       = each.value.trigger_type
  schedule   = each.value.schedule
  enabled    = each.value.enabled
  actions {
    job_name = each.value.actions[0].job_name
  }
  

  lifecycle {
    create_before_destroy = true
  }
}

