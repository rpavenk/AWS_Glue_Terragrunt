# AWS_Glue_Terragrunt
Terragrunt module for AWS Glue

This code is created for AWS Glue Modules to migrate/copy data from a source JDBC to a destination JDBC Glue connection, it creates multiple resources at once for Glue Catalog DB, Glue Connections, Glue Crawlers, Glue Jobs and Glue Triggers. 

The use case for this Application and Module code is to migrate/copy data from Oracle database/datasource from RDS to a Aurora PostgreSQL RDS table or any JDBC connection to another JDBC database.

A similar use case is explained at https://aws.amazon.com/blogs/big-data/automate-etl-jobs-between-amazon-rds-for-sql-server-and-azure-managed-sql-using-aws-glue-studio/

Also provided is a Glue job Python script which has Glue Catalog source and Glue Catalog Target nodes and input parameters can be provided as needed in the Terrgrunt.hcl file for the Glue job creation.
