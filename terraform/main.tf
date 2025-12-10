# VPC module
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr              = "10.0.0.0/16"
  availability_zones    = ["eu-west-1a", "eu-west-1b"]
  public_subnets_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]
}
