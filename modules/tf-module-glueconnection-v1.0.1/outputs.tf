output "glue_connection_ids" {
  description = "List of created Glue connections"
  value       = aws_glue_connection.glue_connections[*].id
}

output "glue_connection_names" {
  description = "List of created Glue connections"
  value       = aws_glue_connection.glue_connections[*].name
}


