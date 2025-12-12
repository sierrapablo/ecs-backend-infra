# VPC Terraform Module

This module provisions a highly available Virtual Private Cloud (VPC) on AWS. It is designed to provide a secure network foundation for your infrastructure.

## Table of Contents

- [Resources Created](#resources-created)
- [Architecture](#architecture)
- [Usage](#usage)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Resources Created

This module creates the following resources:

- **VPC**: The main Virtual Private Cloud.
- **Internet Gateway**: Enables connectivity to the internet for public subnets.
- **Subnets**:
  - **Public Subnets**: One per specified Availability Zone. Instances here have public IP addresses by default.
  - **Private Subnets**: One per specified Availability Zone. No direct internet access.
- **NAT Gateways**: One per Availability Zone (placed in public subnets) to allow instances in private subnets to access the internet for updates/patching while remaining isolated.
- **Route Tables**:
  - A public route table directing traffic to the Internet Gateway.
  - Private route tables (one per AZ) directing traffic to the respective NAT Gateway.
- **Elastic IPs**: Allocated for the NAT Gateways.

## Architecture

The module implements a standard networking topology:

- **High Availability**: By distributing subnets and NAT gateways across multiple Availability Zones.
- **Isolation**: Workloads can be placed in private subnets, only exposed via Load Balancers (in public subnets) or accessed via VPN/Bastion.
- **Public access**: Public subnets are automatically associated with an Internet Gateway.

## Usage

```hcl
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr             = "10.0.0.0/16"
  availability_zones   = ["us-east-1a", "us-east-1b"]
  public_subnets_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
}
```

## Inputs

| Name                    | Type           | Key      | Description                                                |
| ----------------------- | -------------- | -------- | ---------------------------------------------------------- |
| `vpc_cidr`              | `string`       | Optional | CIDR block for the VPC. Default: `10.0.0.0/16`.            |
| `availability_zones`    | `list(string)` | Required | List of Availability Zones for public and private subnets. |
| `public_subnets_cidrs`  | `list(string)` | Required | List of CIDR blocks for public subnets (one per AZ).       |
| `private_subnets_cidrs` | `list(string)` | Required | List of CIDR blocks for private subnets (one per AZ).      |

## Outputs

| Name                 | Description                          |
| -------------------- | ------------------------------------ |
| `vpc_id`             | The ID of the created VPC.           |
| `public_subnet_ids`  | List of IDs for the public subnets.  |
| `private_subnet_ids` | List of IDs for the private subnets. |
| `igw_id`             | The ID of the Internet Gateway.      |
| `nat_gateway_ids`    | List of IDs for the NAT Gateways.    |
