output "name" {
  description = "Nombre del Log Group"
  value       = aws_cloudwatch_log_group.this.name
}

output "arn" {
  description = "ARN del Log Group"
  value       = aws_cloudwatch_log_group.this.arn
}
