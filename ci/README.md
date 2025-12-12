# CI/CD Directory

This directory contains the Continuous Integration and Continuous Deployment (CI/CD) pipelines used for this project.

## Table of Contents

- [Release Pipeline (`release.Jenkinsfile`)](#release-pipeline-releasejenkinsfile)

## Pipelines

### Release Pipeline (`release.Jenkinsfile`)

This Jenkinsfile defines the automated release process for the project, following a Gitflow-based strategy. It handles version bumping, tagging, and branch synchronization.

#### Parameters

The pipeline accepts a single build parameter:

- **`BUMP`**: Determines the type of version increment.
  - `X`: **Major** version bump (e.g., 1.0.0 -> 2.0.0)
  - `Y`: **Minor** version bump (e.g., 1.0.0 -> 1.1.0)
  - `Z`: **Patch** version bump (e.g., 1.0.0 -> 1.0.1)

#### Workflow Steps

1.  **Read Previous Version**: Reads the current version from the `VERSION` file in the project root.
2.  **Calculate New Version**: increments the version numbers based on the selected `BUMP` parameter.
3.  **Create Release Branch**: Creates a temporary branch `release/x.y.z` from `develop`.
4.  **Update Version**: Writes the new version to `VERSION`, commits the change, and pushes the branch.
5.  **Merge to Main**: Merges the release branch into `main` with `--no-ff`.
6.  **Create Tag**: Tags the merge commit on `main` with the new version number.
7.  **Sync Develop**: Merges `main` back into `develop` to ensure it has the latest version info and tags.
8.  **Cleanup**: Deletes the temporary release branch.

#### Prerequisites

- A `VERSION` file must exist in the root of the repository containing the current semantic version (e.g., `1.0.0`).
- The Jenkins job must have SSH credentials configured (ID: `github`) to perform git operations (push, merge, tag).
