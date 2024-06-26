Please refer to the following set of input variables to create a glue catalog database

|Input Variable Name            |Description                         |
|-------------------------------|----------------------------------- |
|region                         | A AWS region where this resource will be created. For eg. eu-west-1
|profile                        | A AWS profile for AWS Account
|environment                    | A two characters code. Refer naming convention for codes.
|account                        | 3 characters defining the AWS account code. Refer naming convention for codes.
|region_code                    | rv AWS region code (example : IR for Ireland, OH for Ohio, ..)
|enable_glue_catalog_database   | Set true to create a glue catalog database
|glue_catalog_database_name     | Provide the name for the glue catalog database
|glue_catalog_database_description| (Optional) provide a description for the glue catalog database
|glue_catalog_database_location_uri| (Optional) set the location uri like database or HDFC path


|Output Variable Name           |Description                         |
|-------------------------------|------------------------------------|
|glue_catalog_database_arn      | ARN of the glue catalog database created
|glue_catalog_database_id       | Id of the glue catalog database created
|glue_catalog_database_name     | Name of the glue catalog database created