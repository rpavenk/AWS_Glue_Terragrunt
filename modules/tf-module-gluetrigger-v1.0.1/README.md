Please refer to the following set of input variables to create a glue crawler

|Input Variable Name            |Description                         |
|-------------------------------|----------------------------------- |
|region                         | A AWS region where this resource will be created. For eg. eu-west-1
|profile                        | A AWS profile for AWS Account
|environment                    | A two characters code. Refer naming convention for codes.
|account                        | 3 characters defining the AWS account code. Refer naming convention for codes.
|region_code                    | rv AWS region code (example : IR for Ireland, OH for Ohio, ..)
|enable_glue_trigger            | Set true to create a glue trigger
|glue_trigger_name              | Provide the name for the glue trigger
|glue_trigger_description       | (Optional) provide a description for the glue trigger
|glue_trigger_enabled           | (Optional) Start the trigger. Defaults to true. Not valid to disable for ON_DEMAND type.
|glue_schedule_expression       | Schedule expression for the Glue Trigger in cron expression (e.g., 'cron(0 12 * * ? *)')
|glue_trigger_type              | The type of trigger. Valid values are CONDITIONAL, ON_DEMAND, and SCHEDULED. ON_DEMAND is the default value
|glue_job_name                  | The name of the job to set the trigger
|glue_arguments                 | Arguments to pass to the Glue Job in map data type, (e.g. {\"--job-bookmark-option\":\"job-bookmark-enable\"})


|Output Variable Name           |Description                         |
|-------------------------------|------------------------------------|
|glue_trigger_id                | Id of the glue trigger created
|glue_trigger_arn               | ARN of the Glue trigger created