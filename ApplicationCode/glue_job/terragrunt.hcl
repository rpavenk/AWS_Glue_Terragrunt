terraform {
  source = "git::https://github.com/rpavenk/AWS_Glue_Terragrunt.git/modules/tf-module-gluejob-v1.0.1.git"
}


include {
  path = find_in_parent_folders()
}

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
  enable_glue_job     = true
  


  glue_job_configurations = [
    {
      glue_job_name_suffix             = "rvjob1"
      glue_role_arn                    = "arn:aws:iam:::role/glue-role"
      script_location                  = "s3://<s3bucket>/RV_Glue_Job_Script.py"
      glue_job_version                 = "4.0"
      glue_job_python_version          = "3"
      glue_connections                 = ["glue-source-conn", "glue-dest-conn"]

      job_parameters = [
        {
          name  = "--SRC_DB"
          value = "rv-glue-oracle-source-catalog-db"
        },
        {
          name  = "--SRC_TABLE"
          value = "database_admin_T12345"
        },
        {
          name  = "--DEST_DB"
          value = "glue-postgres-destination-catalog-db"
        },
        {
          name  = "--DEST_TABLE"
          value = "destinationdb_public_T12345"
        },
        {
          name  = "--SRC_CONNECTION"
          value = "glue-source-conn"
        },
        {
          name  = "--DEST_CONNECTION"
          value = "glue-dest-conn"
        },
        {
          name  = "--enable-continuous-cloudwatch-log"
          value = "true"
        },
        {
          name  = "--enable-metrics"
          value = ""
        }
      ]
    }
  ]

}
