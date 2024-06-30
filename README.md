# AH-INFRA

This repository contains the Terraform/Terragrunt code to deploy an EKS cluster able to deploy the hello-app using ArgoCD.

## Structure

- `.\components` contains the Terragrunt components (modules). There are 2 components:
    - `infra` deploys the AWS infrastructure (EKS cluster, ...)
    - `cluster-apps` deploys the apps needed inside the cluster
- `.\tf` contains the Terraform modules used by Terragrunt


