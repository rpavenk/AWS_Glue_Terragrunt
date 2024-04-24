terraform {
  source = "git::https://github.com/rpavenk/AWS_Glue_Terragrunt.git/modules/tf-module-gluetrigger-v1.0.1.git"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  number                  = "1"
  creator                 = "rvenkatesh"
  tf_state_bucket         = "rvtests3glue"
  tf_state_key            = "${path_relative_to_include()}/terraform.tfstate"
  custom_billing = [
    {
      project_code                      = "test"
      environment                   = "UT"
    }
  ]
  map_migrated_app                  = "test"
  map_migrated                      = "map-code"
    
  glue_trigger_configurations = [
    {
      glue_trigger_name_suffix          = "crawler-trigger1"
      trigger_type                      = "SCHEDULED"
      schedule                          = "cron(0 0 * * ? *)"
      enabled                           = false
      actions = [
        {
          job_name                      = "glue-job-test-rvjob1"
        }
      ]
    },
    {
      glue_trigger_name_suffix          = "crawler-trigger2"
      trigger_type                      = "SCHEDULED"
      schedule                          = "cron(0 12 * * ? *)"
      enabled                           = false
      actions = [
        {
          job_name                      = "glue-job-test-rvjob1"
        }
      ]
    }
  ]
}

