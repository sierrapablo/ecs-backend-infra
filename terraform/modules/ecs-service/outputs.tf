output "id" {
  description = "ID del ECS Service"
  value       = aws_ecs_service.this.id
}

output "name" {
  description = "Nombre del ECS Service"
  value       = aws_ecs_service.this.name
}
