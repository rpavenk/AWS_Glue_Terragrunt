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
  glue_tags           = merge(module.naming-glue.rv_standard_tags, var.glue_additional_tags)
}

# allow glue to assume this role
data "aws_iam_policy_document" "glue_role" {
  statement {
    effect  = "Allow"
    actions = [ "sts:AssumeRole" ]

    principals {
      type        = "Service"
      identifiers = [ "glue.amazonaws.com" ]
    }
  }
}

# create IAM role for glue
resource "aws_iam_role" "glue_role" {
  name               = "glue-role-${module.naming-glue.rv_glue_crawler_name}"
  description        = "Glue role for ${module.naming-glue.rv_glue_crawler_name}"
  assume_role_policy = data.aws_iam_policy_document.glue_role.json
}

# Attach Amazon's managed policy for Glue service
resource "aws_iam_role_policy_attachment" "glue_role" {
  role       = aws_iam_role.glue_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}

# Create policy and attach to the role for above rds_secretmanager_and_kms policy document
resource "aws_iam_role_policy" "allow_rds_secretmanager_and_kms" {
  name   = "allow_rds_secretmanager_and_kms_for_glue_crawler"
  role   = aws_iam_role.glue_role.name
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      for statement in var.glue_policy_statements : {
        "Sid"       : statement.sid,
        "Effect"    : statement.effect,
        "Action"    : statement.actions,
        "Resource"  : statement.resources
      }
    ]
  })
}

resource "aws_glue_crawler" "glue_crawler" {
  count           = var.enable_glue_crawler ? length(var.glue_crawlers) : 0
  name            = "${module.naming-glue.rv_glue_crawler_name}_${var.glue_crawlers[count.index]["glue_crawler_name_suffix"]}"
  description     = "Crawler for ${module.naming-glue.rv_glue_crawler_name}_${var.glue_crawlers[count.index]["glue_crawler_name_suffix"]}"
  tags            = local.glue_tags

  database_name   = var.glue_crawlers[count.index].glue_catalog_database_name
  role            = aws_iam_role.glue_role.arn
  schedule        = var.glue_crawlers[count.index].glue_schedule_expression
  
  
  dynamic "jdbc_target" {
    for_each = var.glue_crawlers[count.index].connection_path
    content {
      connection_name = var.glue_crawlers[count.index].glue_connection_name
      path            = jdbc_target.value
    }
  }
 
  lifecycle {
    create_before_destroy = true
  }

}
