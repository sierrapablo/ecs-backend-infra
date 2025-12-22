variable "aws_region" {
  type        = string
  description = "AWS region to deploy the infrastructure"
}

variable "aws_profile" {
  type        = string
  description = "AWS CLI profile to use"
}

variable "localstack_endpoint" {
  type        = string
  description = "Localstack endpoint"
}

variable "localstack_dummy" {
  type        = string
  description = "Localstack dummy"
  default     = "test"
}

variable "use_localstack" {
  type        = bool
  description = "Use Localstack"
  default     = true
}

variable "name_prefix" {
  type        = string
  description = "Prefix for the resources"
}

variable "env" {
  type        = string
  description = "Environment"
  default     = "dev" # dev, test, prod
}

variable "retention_in_days" {
  type        = number
  description = "Retention in days for the logs"
  default     = 14
}

variable "ecr_arn" {
  type        = string
  description = "ARN of the ECR repository"
}

variable "domain_name" {
  type        = string
  description = "Domain name for the ALB"
}

variable "hosted_zone_id" {
  type        = string
  description = "Hosted zone ID for the Route 53"
}
