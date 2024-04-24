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

data "aws_secretsmanager_secret" "database_secret" {
  count = var.enable_glue_connection ? length(var.glue_connections) : 0
  name  = var.glue_connections[count.index]["connection_secret_name"]
}

resource "aws_glue_connection" "glue_connections" {
  count                     = var.enable_glue_connection ? length(var.glue_connections) : 0
  connection_properties     = {
    JDBC_CONNECTION_URL     = var.glue_connections[count.index]["connection_url"]
    SECRET_ID               = data.aws_secretsmanager_secret.database_secret[count.index].name
  }
  name                      = "${module.naming-glue.rv_glue_connection_name}_${var.glue_connections[count.index]["glue_connection_name_suffix"]}"
  description               = "Glue connection for ${module.naming-glue.rv_glue_connection_name} ${var.glue_connections[count.index]["glue_connection_name_suffix"]}"
  tags                      = local.glue_tags
  connection_type           = upper(var.glue_connections[count.index]["glue_connection_type"])

  physical_connection_requirements {
    availability_zone       = var.glue_connections[count.index]["availability_zone"]
    security_group_id_list  = var.glue_connections[count.index]["sg_ids"]
    subnet_id               = var.glue_connections[count.index]["subnet_id"]
  }


  lifecycle {
    create_before_destroy = true
  }

}
