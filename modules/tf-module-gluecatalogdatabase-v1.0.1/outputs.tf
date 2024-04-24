output "glue_catalog_database_arn" {
  description = "List of ARNs for glue catalog database"
  value       = aws_glue_catalog_database.glue_catalog_database[*].arn
}

output "glue_catalog_database_id" {
  description = "List of Ids created glue catalog databases"
  value       = aws_glue_catalog_database.glue_catalog_database[*].id
}

output "glue_catalog_database_name" {
  description = "List of names created for glue catalog database"
  value       = aws_glue_catalog_database.glue_catalog_database[*].name
}

