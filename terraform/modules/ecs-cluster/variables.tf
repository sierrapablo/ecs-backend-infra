variable "name" {
  description = "Nombre del ECS Cluster"
  type        = string
}

variable "enable_container_insights" {
  description = "Habilitar CloudWatch Container Insights"
  type        = bool
  default     = true
}
