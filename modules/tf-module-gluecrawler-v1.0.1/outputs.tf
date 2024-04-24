output "glue_catalog_crawler_arn" {
  description = "List of ARNs for glue crawlers"
  value       = aws_glue_crawler.glue_crawler[*].arn
}

output "glue_crawler_id" {
  description = "List of IDs of the Glue Crawlers created"
  value       = aws_glue_crawler.glue_crawler[*].id
}

output "glue_crawler_names" {
  description = "List of the names of the Glue Crawlers."
  value       = aws_glue_crawler.glue_crawler[*].name
}

output "glue_role_arn" {
  description = "ARN of Glue Role for crawler"
  value       = element(concat(aws_iam_role.glue_role.*.arn, [""]), 0)
}

output "glue_role_name" {
  description = "Name of Glue Crawler Role"
  value       = element(concat(aws_iam_role.glue_role.*.name, [""]), 0)
}