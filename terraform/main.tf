# VPC module
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr              = "10.0.0.0/16"
  availability_zones    = ["eu-west-1a", "eu-west-1b"]
  public_subnets_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]
}

# IAM module
module "iam" {
  source      = "./modules/iam"
  name_prefix = var.name_prefix

}

# ECS Cluster module
module "ecs_cluster" {
  source = "./modules/ecs-cluster"

  name = "${var.name_prefix}-ecs-cluster"
}

# Logs module
module "logs_app" {
  source = "./modules/logs"

  log_group_name    = "/ecs/${var.name_prefix}"
  retention_in_days = var.retention_in_days

  tags = {
    service = var.name_prefix
    env     = var.env
  }
}

# ECS Task module
module "ecs_task" {
  source = "./modules/ecs-task"

  family = "${var.name_prefix}-ecs-task"

  image = "${var.ecr_arn}/${var.name_prefix}-image:placeholder" # Placeholder, solo levanta infraestructura

  execution_role_arn = module.iam.execution_role_arn
  task_role_arn      = module.iam.task_role_arn

  log_group_name = module.logs_app.name
  region         = var.aws_region
}

# ALB module
module "alb_https" {
  source            = "./modules/alb-https-route53"
  name              = "${var.name_prefix}-alb"
  subnets           = module.vpc.public_subnets
  security_groups   = [module.vpc.alb_sg_id]
  vpc_id            = module.vpc.vpc_id
  target_group_name = "${var.name_prefix}-tg"
  target_port       = 80
  health_check_path = "/health"
  domain_name       = var.domain_name
  hosted_zone_id    = var.hosted_zone_id
  tags              = { env = var.env }
}

# ECS Service module
module "ecs_service" {
  source               = "./modules/ecs-service"
  name                 = "${var.name_prefix}-ecs-service"
  cluster_id           = module.ecs_cluster.id
  task_definition      = module.ecs_task.arn
  desired_count        = 2
  subnets              = module.vpc.private_subnets
  security_groups      = [module.vpc.ecs_sg_id]
  assign_public_ip     = false
  alb_target_group_arn = module.alb_https.target_group_arn
}
