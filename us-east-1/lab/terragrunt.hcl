locals {
  aws_region = "us-east-1"
  account_id = "yor-account-id-here"
  profile = "lab"
  stack = "aws-lab"
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "${local.account_id}-terraform-state"
    key = "${local.stack}/${path_relative_to_include()}-lock/terraform.tfstate"
    region         = "${local.aws_region}"
    encrypt        = true
    dynamodb_table = "${local.account_id}-terraform-lock"
    profile = "${local.profile}"
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region  = "${local.aws_region}"
  profile = "${local.profile}"
}
EOF
}
