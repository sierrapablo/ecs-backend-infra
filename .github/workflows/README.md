# GitHub Actions Workflows

This directory contains the GitHub Actions workflows that automate various aspects of the development and release lifecycle.

## Table of Contents

- [Format Code (`format.yaml`)](#1-format-code-formatyaml)
- [Create Release on Tag (`release.yaml`)](#2-create-release-on-tag-releaseyaml)
- [Terraform Validate (`terraform-validate.yaml`)](#3-terraform-validate-terraform-validateyaml)

## Workflows

### 1. Format Code (`format.yaml`)

Ensures that all Terraform code is correctly formatted.

- **Trigger**: Pushes to the `develop` branch.
- **Actions**:
  - Checks out the code.
  - Sets up the latest version of Terraform.
  - Runs `terraform fmt -recursive` to format all Terraform files.
  - Checks if there are any file changes after formatting.
  - If changes are detected, it commits and pushes them back to the repository (using the `github-actions[bot]` user).

### 2. Create Release on Tag (`release.yaml`)

Automates the creation of GitHub Releases when a version tag is pushed.

- **Trigger**: Pushes of any tag (e.g., `v1.0.0`, `1.0.0`).
- **Actions**:
  - Checks out the code.
  - Verifies that the tag's commit is an ancestor of the `main` branch. If not, the release is skipped.
  - Identifies the previous tag to generate a changelog.
  - Generates a list of commits ("what's changed") since the last tag.
  - Creates a GitHub Release associated with the tag, including the generated changelog in the body.

### 3. Terraform Validate (`terraform-validate.yaml`)

Validates the syntax and structure of Terraform configuration files during code reviews.

- **Trigger**: Pull Requests targeting the `develop` branch.
- **Actions**:
  - Checks out the code.
  - Sets up the latest version of Terraform.
  - Runs `terraform init -backend=false` (initialization without backend).
  - Runs `terraform validate` to check for syntax errors and internal consistency.
  - Posts a comment on the Pull Request with the result of the validation (success or failure) and the output log.
  - Fails the workflow if validation fails, preventing the PR from being merged if checks are required.
