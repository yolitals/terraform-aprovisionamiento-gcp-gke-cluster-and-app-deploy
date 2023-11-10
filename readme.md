# GKE Cluster and Voting app

## 1 - GCP project

Create a GCP project and enable container service

```sh
# Move to database directory
cd 1-terraform-gc-project
# Get plugins and modules
terraform init
# Dry run to validate resources to create
terraform plan
# expected output:
# Plan: 3 to add, 0 to change, 0 to destroy.
# Create resouces
terraform apply
# If you want destroy resouces
terraform destroy
```

## 2 - GKE Cluster

Create a GKE cluster with public endpoint

```sh
# Move to backend directory
cd 2-terraform-gcp-gke
# Get plugins and modules
terraform init
# Dry run to validate resources to create
terraform plan
# expected output:
# Plan: 1 to add, 0 to change, 0 to destroy.
# Create resouces
terraform apply
# If you want destroy resouces
terraform destroy
```

## 3 - Deploy voting app

Deploy all required k8s manifest to deploy voting app

```sh
# Move to frontend directory
cd 3-terraform-gcp-k8s-manifests
# Get plugins and modules
terraform init
# Dry run to validate resources to create
terraform plan
# expected output:
# Plan: 9 to add, 0 to change, 0 to destroy.
# Create resouces
terraform apply
# If you want destroy resouces
terraform destroy
```
