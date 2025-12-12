# Terraform Infrastructure

This directory contains the main Terraform configuration for the ECS Backend Infrastructure. It serves as the root module that orchestrates the provisioning of AWS resources.

## Table of Contents

- [Modules](#modules)
- [Architecture](#architecture)
- [Prerequisites](#prerequisites)
- [Usage](#usage)

## Modules

The infrastructure is composed of the following modules instantiated in `main.tf`:

### VPC

- **Source**: `./modules/vpc`
- **Purpose**: Provisions the networking foundation (VPC, Subnets, NAT Gateways, Internet Gateway).
- **Configuration**:
  - **Region**: `eu-west-1` (implied by AZs)
  - **CIDR**: `10.0.0.0/16`
  - **Availability Zones**: `eu-west-1a`, `eu-west-1b`
  - **Public Subnets**: `10.0.1.0/24`, `10.0.2.0/24`
  - **Private Subnets**: `10.0.11.0/24`, `10.0.12.0/24`

## Architecture

Currently, this configuration sets up the base **Networking Layer**:

1.  **VPC**: A dedicated virtual network.
2.  **Public Zone**: Subnets with direct internet access (via Internet Gateway). Use for Load Balancers or Bastion hosts.
3.  **Private Zone**: Subnets with restricted internet access (via NAT Gateway). Use for application containers (ECS Tasks) and databases (RDS).

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed (version defined in `versions.tf`).
- [AWS CLI](https://aws.amazon.com/cli/) installed and configured.
- AWS Credentials configured with sufficient permissions.

## Usage

1.  **Initialize**: Download providers and modules.

    ```bash
    terraform init
    ```

2.  **Plan**: Preview changes.

    ```bash
    terraform plan
    ```

3.  **Apply**: Create/Update resources.
    ```bash
    terraform apply
    ```
