variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block for the VPC"
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability zones for public and private subnets"
}

variable "public_subnets_cidrs" {
  type        = list(string)
  description = "CIDRs for public subnets, one per AZ"
}

variable "private_subnets_cidrs" {
  type        = list(string)
  description = "CIDRs for private subnets, one per AZ"
}
