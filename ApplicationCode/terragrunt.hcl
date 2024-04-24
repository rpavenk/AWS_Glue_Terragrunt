
remote_state {
  backend = "s3"
  config = {
    bucket         = "rvtests3glue"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "ap-southeast-2"
    profile        = "<profilename>"
  }
}


inputs = {
  account         = "test"
  project_code    = "test"
  environment     = "ut"
  creator         = "rvenkatesh"
  owner           = "rvenkatesh"
  region          = ""
  profile         = "default"
  number              = "1"
  tf_state_bucket     = "rvtests3glue"
  tf_state_key        = "${path_relative_to_include()}/terraform.tfstate"

}
