# Subnets
output "public_subnets" {
  description = "Lista de subnets públicas"
  value       = aws_subnet.public[*].id
}

output "private_subnets" {
  description = "Lista de subnets privadas"
  value       = aws_subnet.private[*].id
}

# Security groups
output "alb_sg_id" {
  description = "Security Group para el ALB"
  value       = aws_security_group.alb.id
}

output "ecs_sg_id" {
  description = "Security Group para ECS tasks"
  value       = aws_security_group.ecs.id
}

# VPC ID
output "vpc_id" {
  description = "ID de la VPC"
  value       = aws_vpc.main.id
}
