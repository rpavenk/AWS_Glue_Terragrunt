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
}

resource "aws_glue_catalog_database" "glue_catalog_database" {
  count          = var.enable_glue_catalog_database  ? length(var.glue_catalog_databases) : 0

  name           = "${module.naming-glue.rv_glue_catalogdb_name}_${var.glue_catalog_databases[count.index]["glue_database_name_suffix"]}"
  description    = "Catalog DB for ${module.naming-glue.rv_glue_catalogdb_name} ${var.glue_catalog_databases[count.index]["glue_database_name_suffix"]}"
  location_uri   = var.glue_catalog_databases[count.index]["glue_catalog_database_location_uri"]


  lifecycle {
    create_before_destroy = true
  }

}
