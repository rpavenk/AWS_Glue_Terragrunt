data "aws_region" "current" {}

locals {

  # Normalize inputs
  project_code          = lower(var.project_code)
  account           = lower(var.account)
  environment       = lower(var.environment)
  specification     = lower(var.specification)
  number            = lower(var.number)
  creator           = lower(var.creator)
  owner             = lower(var.owner)

  # Build standard base name
  default_naming_order                     = ["account", "project_code", "environment", "specification", "number"]
  default_naming_order_without_account     = ["project_code", "environment", "specification", "number"]
  default_naming_order_without_environment = ["account", "project_code", "specification", "number"]
  default_delimiter                        = "-"
  default_name_values_list = {
    account       = local.account
    project_code      = local.project_code
    environment   = local.environment
    specification = local.specification
    number        = local.number
  }

  default_name_parts_list = [for l in local.default_naming_order : local.default_name_values_list[l] if length(local.default_name_values_list[l]) > 0]
  default_name            = lower(join(local.default_delimiter, local.default_name_parts_list))

  default_name_without_account_parts_list     = [for l in local.default_naming_order_without_account : local.default_name_values_list[l] if length(local.default_name_values_list[l]) > 0]
  default_name_without_account                = lower(join(local.default_delimiter, local.default_name_without_account_parts_list))
  default_name_without_environment_parts_list = [for l in local.default_naming_order_without_environment : local.default_name_values_list[l] if length(local.default_name_values_list[l]) > 0]
  default_name_without_environment            = lower(join(local.default_delimiter, local.default_name_without_environment_parts_list))

  # -----------------------------------------------------------
  # rv region codes
  # -----------------------------------------------------------
  region_short_codes = tomap({
      "northeast" = "ne"
      "northwest" = "nw",
      "southeast" = "se",
      "southwest" = "sw",
      "central"   = "cc",
      "east"      = "ee",
      "west"      = "ww",
      "north"     = "nn",
      "south"     = "ss"
  })

  region_table  = split("-", data.aws_region.current.name)
  region_short  = lookup(local.region_short_codes, local.region_table[1], "")
  rv_region_code = (local.region_short  == "") ? "" : "${local.region_table[0]}${local.region_short}${local.region_table[2]}"

  # -----------------------------------------------------------
  # rv terraform tags
  # -----------------------------------------------------------
   rv_terraform_tags = tomap({
     "rv:tf_state_bucket"=var.tf_state_bucket,
     "rv:tf_state_key"=var.tf_state_key,
     "rv:source_creation"="${var.tf_stack_repository}:${var.tf_deploy_mode}"
  })

  # -----------------------------------------------------------
  # rv standard tags
  # -----------------------------------------------------------
  billing_infos        = length(var.custom_billing) == 0 ? [{ project_code = local.project_code, environment = local.environment }] : var.custom_billing
  billing_info_test-env = [for billing_info in local.billing_infos : join("-", [billing_info.project_code, billing_info.environment])]

  rv_mapmigrated_tags = var.map_migrated != "" ? tomap({"map-migrated"=var.map_migrated, "map-migrated-app"= var.map_migrated_app}) : null

  rv_standard_tags = merge(
    tomap({
      "rv:test-env-platform" = upper(join("+", local.billing_info_test-env)),
      "rv:creator+owner" = "${local.creator}+${local.owner}"
    }),
    local.rv_mapmigrated_tags,
    local.rv_terraform_tags,
    var.additional_tags
  )

  # -----------------------------------------------------------
  # rv standard naming
  # -----------------------------------------------------------
  
  rv_s3_bucket_name                           = replace(local.default_name, "_", "")
  rv_security_group_name                      = "sgr-${local.default_name_without_account}"
  rv_default_suffix                           = "-${local.default_name}"
  rv_glue_connection_name                     = "glue-connection-${local.default_name}"
  rv_glue_catalogdb_name                      = "glue-catalogdb-${local.default_name}"
  rv_glue_crawler_name                        = "glue-crawler-${local.default_name}"
  rv_glue_job_name                            = "glue-job-${local.default_name}"
  rv_glue_trigger_name                        = "glue-trigger-${local.default_name}"

}
