variable "family" {
  description = "Family name de la Task Definition"
  type        = string
}

variable "container_name" {
  description = "Nombre del contenedor"
  type        = string
  default     = "app"
}

variable "image" {
  description = "Imagen Docker"
  type        = string
}

variable "cpu" {
  description = "CPU para la task (Fargate)"
  type        = number
  default     = 256
}

variable "memory" {
  description = "Memoria para la task (Fargate)"
  type        = number
  default     = 512
}

variable "container_port" {
  description = "Puerto expuesto por el contenedor"
  type        = number
  default     = 80
}

variable "execution_role_arn" {
  description = "ARN del ECS Task Execution Role"
  type        = string
}

variable "task_role_arn" {
  description = "ARN del ECS Task Role"
  type        = string
}

variable "log_group_name" {
  description = "CloudWatch Log Group name"
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
}
