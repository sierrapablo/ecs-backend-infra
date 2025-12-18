output "arn" {
  description = "ARN de la Task Definition"
  value       = aws_ecs_task_definition.this.arn
}

output "family" {
  description = "Family de la Task Definition"
  value       = aws_ecs_task_definition.this.family
}
