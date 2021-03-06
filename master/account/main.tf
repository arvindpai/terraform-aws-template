terraform {
  backend "s3" {
    bucket         = "terraform-state-{**NAME**}"
    key            = "master/account/terraform.tfstate"
    region         = "us-east-1"
    profile        = "{**PROFILE**}"
    dynamodb_table = "terraform-state-{**NAME**}"
  }
}

provider "aws" {
  profile = local.workspace["profile"]
  region  = local.workspace["region"]
}

provider "aws" {
  profile = local.workspace["profile"]
  region  = "us-east-1"
  alias   = "edge"
}

# Output
data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}
