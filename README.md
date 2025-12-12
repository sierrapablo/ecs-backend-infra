# AWS ECS Backend Infrastructure

[![Latest Release](https://img.shields.io/github/v/release/sierrapablo/ecs-backend-infra?logo=github&style=flat-square)](https://github.com/sierrapablo/ecs-backend-infra/releases)
[![Terraform Validate](https://github.com/sierrapablo/ecs-backend-infra/actions/workflows/terraform-validate.yaml/badge.svg)](https://github.com/sierrapablo/ecs-backend-infra/actions/workflows/terraform-validate.yaml)
[![Format Code](https://github.com/sierrapablo/ecs-backend-infra/actions/workflows/format.yaml/badge.svg)](https://github.com/sierrapablo/ecs-backend-infra/actions/workflows/format.yaml)

> **🚧 Active Development**: This project is currently under active construction. Features, modules, and architecture are evolving and are subject to change.

## Overview

This repository contains the **Infrastructure as Code (IaC)** required to provision a scalable and highly available backend environment on **Amazon Web Services (AWS)** using **Terraform**.

The primary objective is to facilitate the deployment of a SaaS backend on **Amazon ECS (Elastic Container Service)**. The infrastructure is designed to be modular, secure, and fully automated.

## Repository Structure

The project is organized into several key directories, each with its own specific documentation:

| Directory                | Description                                                                                 | Documentation                                       |
| ------------------------ | ------------------------------------------------------------------------------------------- | --------------------------------------------------- |
| **`terraform/`**         | The core infrastructure definition, including the `main` configuration and provider setups. | [View Documentation](./terraform/README.md)         |
| **`terraform/modules/`** | Reusable, self-contained Terraform modules (e.g., VPC).                                     | [VPC Module](./terraform/modules/vpc/README.md)     |
| **`ci/`**                | Jenkins pipelines managing the release lifecycle and versioning (Gitflow).                  | [View Documentation](./ci/README.md)                |
| **`.github/workflows/`** | GitHub Actions workflows for continuous integration (Format, Validate) and GitHub Releases. | [View Documentation](./.github/workflows/README.md) |

### Features

- **Modular Architecture**: Leveraging Terraform modules to create reusable components (currently featuring a robust VPC implementation).
- **Automated Quality Checks**:
  - **Validation**: Terraform syntax and configuration validation on every Pull Request.
  - **Formatting**: Automatic formatting of Terraform code (`terraform fmt`) to ensure style consistency.
- **Release Automation**:
  - **Gitflow Strategy**: Automated version bumping, tagging, and changelog generation using Jenkins and GitHub Actions.

### Getting Started

To get started with provisioning the infrastructure:

1.  Navigate to the **Terraform** directory.
2.  Follow the instructions in the [Terraform README](./terraform/README.md) to initialize and plan your deployment.

## Credits

**Pablo Sierra** - _Initial work & Maintenance_ - [sierrapablo](https://github.com/sierrapablo)

## License

This project is licensed under the **MIT License** - see the [LICENSE](./LICENSE) file for details.
