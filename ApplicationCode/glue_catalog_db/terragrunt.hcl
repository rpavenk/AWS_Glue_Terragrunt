terraform {
  source = "git::https://github.com/rpavenk/AWS_Glue_Terragrunt.git/modules/tf-module-gluecatalogdatabase-v1.0.1.git"
}


include {
  path = find_in_parent_folders()
}

#prevent_destroy = true

inputs = {
  number                            = "1"
  creator                           = "rvenkatesh"
  tf_state_bucket                   = "rvtests3glue"
  tf_state_key                      = "${path_relative_to_include()}/terraform.tfstate"
  enable_glue_catalog_database      = true
  custom_billing = [
          {
              project_code = "test"
              environment = "UT"
          }
          ]
  map_migrated_app = "test"
  map_migrated = "map-code"

  glue_catalog_databases = [
    {
      glue_database_name_suffix        = "rv-glue-oracle-source-catalog-db"
      glue_catalog_database_location_uri= "/"
    },
    {
      glue_database_name_suffix        = "rv-glue-postgres-destination-catalog-db"
      glue_catalog_database_location_uri= "/"
    }
  ]
}