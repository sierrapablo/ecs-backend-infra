provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

provider "aws" {
  alias = "localstack"

  region                      = var.aws_region
  access_key                  = var.localstack_dummy
  secret_key                  = var.localstack_dummy
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    ecs     = var.localstack_endpoint
    iam     = var.localstack_endpoint
    logs    = var.localstack_endpoint
    route53 = var.localstack_endpoint
    ec2     = var.localstack_endpoint
    elbv2   = var.localstack_endpoint
    acm     = var.localstack_endpoint
    sts     = var.localstack_endpoint
  }
}

