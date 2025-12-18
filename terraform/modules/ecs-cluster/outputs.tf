output "id" {
  description = "ID del ECS Cluster"
  value       = aws_ecs_cluster.this.id
}

output "arn" {
  description = "ARN del ECS Cluster"
  value       = aws_ecs_cluster.this.arn
}

output "name" {
  description = "Nombre del ECS Cluster"
  value       = aws_ecs_cluster.this.name
}
