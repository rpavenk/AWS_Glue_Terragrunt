## Module Glue Connection tf-module-glueconnection
* Version v1.0.1
* Initial version of glue connection using :
* a. parameter store database password
* b. JDBC connection properties for connection
*
* Reference to standard-naming-tf.git//?ref=v1.0.1
* 
* 
* 
* 
* 
*
*
*


## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="glueconnection"></a> [glueconnection](#module\glueconnection) | git::https://github.com/rpavenk/AWS_Glue_Terragrunt.git/modules/conventions/standard-naming-tf.git// | v1.0.1 |


## Resources

| Name | Type |
|------|------|
| [aws_glue_connection.glue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/glue_connection) | resource |



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_glue_connection"></a> [enable\_glue\_connection](#input\enable\glue\connection) | true or false | `boolean` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\vpc\_id) | vpc_id for the glue connection network settings | `string` | `` | yes |
| <a name="input_glue_connection_name"></a> [glue\_connection\_name](#input\glue\_connection\_name) | The name of the connection in the list of glue connections to be created | `string` | `` | yes |
| <a name="input_glue_connection_description"></a> [glue\_connection\_name](#input\glue\_connection\_description) | The description for the connection in the list of glue connections to be created | `string` | `` | no |
| <a name="input_glue_connection_type"></a> [connection\_type](#input\glue\connection\_type) | The type of the connection. Supported are: 'JDBC', 'MONGODB', 'KAFKA', and 'NETWORK'. Defaults to JBDC | `string` | `"JDBC"` | yes |
| <a name="input_jdbc_url"></a> [jdbc\_url](#input\jdbc\_url) | The JDBC connection url ith the format jdbc:protocol://host:port/db_name | `string` | jdbc:protocol://host:port/db_name | yes |
| <a name="input_database_ssm_password"></a> [database\_ssm\_password](#input\database\_ssm\_password) | name of the parameter store for database password | `string` | `"/rv/rds_password"` | yes |
| <a name="input_connection_url"></a> [jdbc\_url](#input\connection\_url) | For JDBC connections, he connection url with the JDBC format jdbc:protocol://host:port/db_name | `string` | jdbc:protocol://host:port/db_name | yes |





## Outputs

| Name | Description |
|------|-------------|
| <a name="output_glue_connection_ids"></a> [glue\_connection\_ids](#output\_name) | List of Glue Connections names created|