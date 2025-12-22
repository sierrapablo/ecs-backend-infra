variable "name" {}
variable "subnets" {}
variable "security_groups" {}
variable "vpc_id" {}

variable "target_group_name" {}
variable "target_port" {}
variable "protocol" {}

variable "domain_name" {}
variable "hosted_zone_id" {}

variable "tags" {
  type    = map(string)
  default = {}
}
