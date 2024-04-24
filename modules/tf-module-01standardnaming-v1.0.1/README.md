## Module standard-naming-tf
* Naming conventions
* Version v1.0.1
* 
* This module helps to keep consistency in tagging and naming AWS ressources
* It provide outputs:
* - standard ressource naming
* - standard tags (mandatory + optional if required)
* - region codes
* 

## Usage example:

module "naming" {\
  source                = "git::https://github.com/rpavenk/AWS_Glue_Terragrunt.git/modules/tf-module-01standardnaming-v1.0.1.git//?ref=main" \
  environment           = "UT" \
  account               = "test" \
  project_code          = "TEST" \
  specification         = "application" \
  number                = "1" \
  creator               = "rvenkatesh" \
  owner                 = "rvenkatesh" \
  region                = "eu-west-1" \
  tf_stack_repository   = "https://github.com/rpavenk/AWS_Glue_Terragrunt.git/" \
  tf_state_bucket       = "rvenkatesh" \
  tf_state_key          = "terraform.tfstate" \
}

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 (compatible 1.0) |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|


## Outputs

| Name | Description |
|------|-------------|
