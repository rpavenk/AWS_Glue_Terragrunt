output "rv_standard_tags" {
  value       = local.rv_standard_tags
  description = "rv Standard Tag map"
}

output "rv_s3_bucket_name" {
  value       = local.rv_s3_bucket_name
  description = "rv Standard S3 bucket name"
}

output "rv_security_group_name" {
  value       = local.rv_security_group_name
  description = "rv Standard security group name"
}

output "rv_glue_catalogdb_name" {
  value       = local.rv_glue_catalogdb_name
  description = "rv Standard Glue Catalog DB name"
}

output "rv_glue_connection_name" {
  value       = local.rv_glue_connection_name
  description = "rv Standard Glue Connection name"
}

output "rv_glue_crawler_name" {
  value       = local.rv_glue_crawler_name
  description = "rv Standard Glue Crawler name"
}

output "rv_glue_job_name" {
  value       = local.rv_glue_job_name
  description = "rv Standard Glue Job name"
}

output "rv_glue_trigger_name" {
  value       = local.rv_glue_trigger_name
  description = "rv Standard Glue Trigger name"
}
