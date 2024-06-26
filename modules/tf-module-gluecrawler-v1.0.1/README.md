Please refer to the following set of input variables to create a glue crawler

|Input Variable Name            |Description                         |
|-------------------------------|----------------------------------- |
|region                         | A AWS region where this resource will be created. For eg. eu-west-1
|profile                        | A AWS profile for AWS Account
|environment                    | A two characters code. Refer naming convention for codes.
|account                        | 3 characters defining the AWS account code. Refer naming convention for codes.
|region_code                    | rv AWS region code (example : IR for Ireland, OH for Ohio, ..)
|enable_glue_crawler            | Set true to create a glue crawler
|enable_glue_role               | Set it to true to create an IAM role for Glue Crawler
|glue_crawler_name              | Provide the name for the glue crawler
|glue_crawler_description       | (Optional) provide a description for the glue crawler
|glue_catalog_database_name     | Glue database where results are written after crawling
|glue_crawler_db_name           | The data source to crawl
|glue_connection_name           | The name of the glue connection to use in crawler
|connection_path                | The path of the table or schema on data source to crawl
|glue_crawler_schedule          | (Optional) A cron expression used to specify the schedule. For more information, see Time-Based Schedules for Jobs and Crawlers. For example, to run something every day at 12:15 UTC, you would specify: cron(15 12 * * ? *).
|glue_schedule_expression       | (Optional) A cron expression used to specify the schedule. Time-Based Schedules for Jobs and Crawlers


|Output Variable Name           |Description                         |
|-------------------------------|------------------------------------|
|crawler_id                     | Id of the glue crawler created
|crawler_name                   | Name of the glue crawler created
|glue_role_arn                  | ARN of the IAM role for Glue crawler created
|glue_role_name                 | Name of the IAM role for Glue crawler created