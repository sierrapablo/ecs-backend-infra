variable "log_group_name" {
  description = "Nombre del CloudWatch Log Group"
  type        = string
}

variable "retention_in_days" {
  description = "Días de retención de logs"
  type        = number
  default     = 14
}

variable "tags" {
  description = "Tags comunes"
  type        = map(string)
  default     = {}
}
