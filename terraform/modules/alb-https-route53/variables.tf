variable "name" {
  description = "Nombre del ALB"
  type        = string
}

variable "subnets" {
  description = "Subnets públicas para el ALB"
  type        = list(string)
}

variable "security_groups" {
  description = "Security groups del ALB"
  type        = list(string)
}

variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
}

variable "target_group_name" {
  description = "Nombre del Target Group"
  type        = string
}

variable "target_port" {
  description = "Puerto de los contenedores Fargate"
  type        = number
  default     = 80
}

variable "protocol" {
  description = "Protocolo del listener y target group"
  type        = string
  default     = "HTTP"
}

variable "health_check_path" {
  description = "Path para health check"
  type        = string
  default     = "/health"
}

variable "domain_name" {
  description = "Dominio que apunta al ALB (ej. api.domain.com)"
  type        = string
}

variable "hosted_zone_id" {
  description = "ID de la Hosted Zone existente"
  type        = string
}

variable "tags" {
  description = "Tags para recursos"
  type        = map(string)
  default     = {}
}
