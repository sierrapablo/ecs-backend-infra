# VPC outputs
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnets
}

output "private_subnet_ids" {
  value = module.vpc.private_subnets
}

output "ecs_task_execution_role_arn" {
  description = "IAM role usado por ECS para ejecutar las tasks"
  value       = module.iam.execution_role_arn
}

output "ecs_task_role_arn" {
  description = "IAM role usado por ECS para ejecutar las tasks"
  value       = module.iam.task_role_arn
}

output "ecs_cluster_id" {
  description = "ID del ECS Cluster"
  value       = module.ecs_cluster.id
}

output "ecs_cluster_name" {
  description = "Nombre del ECS Cluster"
  value       = module.ecs_cluster.name
}

output "ecs_log_group_name" {
  description = "Nombre del Log Group"
  value       = module.logs_app.name
}
