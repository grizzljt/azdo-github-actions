# Continuous Integration with GitHub Actions and HashiCorp Terraform
GitHub Actions, repos, and packages examples

# Manually Created sources
- Service Account to run pipelines
- Storage account for Terraform State and Plan files
- AzDO Project
- GitHub repository
- GitHub secrets

## Overview

In this scenario, continuous integration of an Azure environment is desired. Configuration is managed via HashiCorp Terraform. Continuous Integration is managed via GitHub Actions. By loading the necessary Terraform configuration files into this repository along with two GitHub Workflows, the Terraform files can be used to Plan and Apply into the target environment.

## Details

This repository contains three GitHub Workflow files:

* [Terraform Plan](/.github/workflows/tf-plan.yaml) - Triggered by any Pull Request.

* [Terraform Apply](/.github/workflows/tf-apply.yaml) - Triggered by a Push into the `master` branch.

*[Docker Build and Push to Git Packages](/.github/workflows/docker.yaml) - Triggered by a Pull Request or Push into the `master` branch.


## Terraform Plan

* Checks the Terraform configuration for security vulnerabilities with [tfsec](https://github.com/liamg/tfsec).

* Loads the Terraform CLI wrapper with [Setup Terraform](https://github.com/marketplace/actions/hashicorp-setup-terraform)

* Terraform CLI performs an `Init` and `Plan` based on the pull request's configuration.

* GitHub Actions Bot adds a comment to the pull request with the results. [Example Pull Request](https://github.com/grizzljt/azdo-github-actions/pull/3#issuecomment-668903045)

You can view pervious Terraform Plan workflows [here](https://github.com/grizzljt/azdo-github-actions/actions?query=workflow%3A%22Terraform+Plan%22).

## Terraform Apply

* Loads the Terraform CLI wrapper with [Setup Terraform](https://github.com/marketplace/actions/hashicorp-setup-terraform)

* Terraform CLI performs an `Init` and `Apply` based on the new push configuration.

You can view pervious Terraform Apply workflows [here](https://github.com/grizzljt/azdo-github-actions/actions?query=workflow%3A%22Terraform+Apply%22).

## Credentials

Credentials are stored in GitHub secrets.

`CLIENTSECRET` is the password for the Service Principal deploying the Terraform.

`ACCESSKEY` is the access key for the storage account where the Terraform State files are stored.

# Terraform Documentation

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.29 |
| azuredevops | >= 0.0.1 |
| azurerm | 2.14 |
| random | 2.3.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | 2.14 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app\_name | The application to which the Terraform configuration is beholden | `string` | `"mastery"` | no |
| client\_id | n/a | `string` | n/a | yes |
| client\_secret | n/a | `string` | n/a | yes |
| environment | The environment to which the Terraform configuration will be deployed | `string` | `"dev"` | no |
| region\_primary | The primary region to which the Terraform configuration is deployed | `string` | `"eastus2"` | no |
| subscription\_id | n/a | `string` | n/a | yes |
| tags | The default tags to be applied to infrastructure | `map` | `{}` | no |
| tenant\_id | n/a | `string` | n/a | yes |

## Outputs

No output.
