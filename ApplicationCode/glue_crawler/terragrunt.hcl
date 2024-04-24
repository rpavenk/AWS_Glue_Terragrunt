terraform {
  source = "git::https://github.com/rpavenk/AWS_Glue_Terragrunt.git/modules/tf-module-gluecrawler-v1.0.1.git"
}


include {
  path = find_in_parent_folders()
}

prevent_destroy = true

inputs = {
  number                            = "1"
  creator                           = "rvenkatesh"
  tf_state_bucket                   = "rvtests3glue"
  tf_state_key                      = "${path_relative_to_include()}/terraform.tfstate"
  custom_billing = [
    {
      project_code                      = "test"
      environment                   = "UT"
    }
  ]
  map_migrated_app                  = "test"
  map_migrated                      = "map-code"
  enable_glue_crawler               = true

  glue_policy_statements = [
    {
      sid      = "SecretsManagerDbCredentialsAccess"
      effect   = "Allow"
      actions  = ["secretsmanager:GetSecretValue", "secretsmanager:DescribeSecret"]
      resources= ["arn:aws:secretsmanager:*:*:secret:rds*"]
    },
    {
      sid      = "AllowRDS"
      effect   = "Allow"
      actions  = ["rds-data:ExecuteSql", "rds-data:ExecuteStatement"]
      resources= ["arn:aws:rds:*:*:db:oracledatabase", "arn:aws:rds:*:*:*:postgresdatabase*"]
    },
    {
      sid      = "AllowS3"
      effect   = "Allow"
      actions  = ["s3:GetObject", "s3:ListBucket"]
      resources= ["arn:aws:s3:::<bucketname>/*"]
    }
  ]

  glue_crawlers = [
    {
      glue_crawler_name_suffix      = "glue-source-crawler"
      glue_catalog_database_name    = "rv-glue-oracle-source-catalog-db"
      glue_connection_name          = "glue-source-conn"
      connection_path               = ["DATABASE/T12345", "DATABASE/T23456"]
      glue_schedule_expression      = "cron(0 0 * * ? *)"
    },
    {
      glue_crawler_name_suffix      = "glue-destination-crawler"
      glue_catalog_database_name    = "rv-glue-postgres-destination-catalog-db"
      glue_connection_name          = "glue-destination-conn"
      connection_path               = ["destinationdb/T12345", "destinationdb/T23456"]
      glue_schedule_expression      = "cron(0 12 * * ? *)"
    }
  ]
 
}