terraform {
  source = "git::https://github.com/rpavenk/AWS_Glue_Terragrunt.git/modules/tf-module-glueconnection-v1.0.1.git"
}

include {
  path = find_in_parent_folders()
}

#prevent_destroy = true

inputs = {
  number                 = "1"
  creator                = "rvenkatesh"
  tf_state_bucket        = "rvtests3glue"
  tf_state_key           = "${path_relative_to_include()}/terraform.tfstate"
  custom_billing = [
    {
      project_code = "test"
      environment = "UT"
    }
  ]
  map_migrated_app = "test"
  map_migrated = "map-code"
  enable_glue_connection = true
  
  glue_connections = [
    {
      glue_connection_name_suffix   = "glue-source-conn"
      glue_connection_type          = "JDBC"
      connection_url                = "jdbc:oracle:thin:@//oracledatabase-test.<region>.rds.amazonaws.com:1521/DATABASE"
      connection_secret_name        = "rds!db-<secret-id>"
      availability_zone             = "ap-southeast-2c"
      sg_ids                        = ["sg-12345"]
      subnet_id                     = "subnet-12345"
    },
    {
      glue_connection_name_suffix   = "glue-dest-conn"
      glue_connection_type          = "JDBC"
      connection_url                = "jdbc:postgresql://postgresdatabase-1.test.<region>.rds.amazonaws.com:5432/destinationdb"
      connection_secret_name        = "rds!cluster-<secret-id>"
      availability_zone             = "ap-southeast-2c"
      sg_ids                        = ["sg-23456"]
      subnet_id                     = "subnet-23456"
    }
  ]
}
