variable "name" {
  description = "Nombre del ECS Service"
  type        = string
}

variable "cluster_id" {
  description = "ID del ECS Cluster"
  type        = string
}

variable "task_definition" {
  description = "ARN de la Task Definition (puede ser placeholder)"
  type        = string
}

variable "desired_count" {
  description = "Número de instancias de la task"
  type        = number
  default     = 1
}

variable "subnets" {
  description = "Lista de subnets donde desplegar el servicio"
  type        = list(string)
}

variable "security_groups" {
  description = "Lista de Security Groups"
  type        = list(string)
}

variable "assign_public_ip" {
  description = "Asignar IP pública a las tasks"
  type        = bool
  default     = false
}

variable "launch_type" {
  description = "Tipo de lanzamiento"
  type        = string
  default     = "FARGATE"
}

variable "deployment_minimum_healthy_percent" {
  type    = number
  default = 50
}

variable "deployment_maximum_percent" {
  type    = number
  default = 200
}

variable "enable_ecs_managed_tags" {
  type    = bool
  default = true
}

variable "propagate_tags" {
  type    = string
  default = "SERVICE"
}

variable "alb_target_group_arn" {
  description = "ARN del Target Group del ALB (opcional)"
  type        = string
  default     = ""
}
