Please refer to the following set of input variables to create a glue crawler

|Input Variable Name            |Description                         |
|-------------------------------|----------------------------------- |
|region                         | A AWS region where this resource will be created. For eg. eu-west-1
|profile                        | A AWS profile for AWS Account
|environment                    | A two characters code. Refer naming convention for codes.
|account                        | 3 characters defining the AWS account code. Refer naming convention for codes.
|region_code                    | rv AWS region code (example : IR for Ireland, OH for Ohio, ..)
|enable_glue_job                | Set true to create a glue job
|enable_glue_role               | Set it to true to create an IAM role for Glue job
|glue_job_name                  | Provide the name for the glue job
|glue_job_description           | (Optional) provide a description for the glue job
|glue_job_role_arn              | The ARN of the existing IAM role associated with this job if you don't want a new role to be created using this module
|glue_job_connections           | List of glue connections to use in this glue job
|glue_script_name               | Name of python script file for glue job, should end with .py
|glue_job_glue_version          | (Optional) The version of glue to use, for example '1.0'
|glue_job_python_version        | (Optional) The version of python to use, for example '2' or '3'
|glue_script_bucket_name        | Name/path of the s3 bucket where the python script resides
|glue_db_name                   | Name of the datasource database instance for Glue to connect



|Output Variable Name           |Description                         |
|-------------------------------|------------------------------------|
|glue_job_id                    | Id of the glue job created
|glue_job_arn                   | ARN of the Glue job created
|glue_job_name                  | Name of the glue job created
|glue_role_arn                  | ARN of the IAM role for Glue job created
|glue_role_name                 | Name of the IAM role for Glue job created