# Terraform
This repository contains some basic tutorial files of terraform infrastructure management.
## Introduction
Terraform is a infrastructure as a code it is mainly a infrastructure provisioning tool. \
Terraform is used for automate the provisioning, configuring and managing the infrastructure.
## Installation
### a. On Debian family distributions
```
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt install terraform
```
### b. On Redhat family distributions
```
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/$release/hashicorp.repo
yum install terraform
```
## Terraform Workflow
**a. terraform init** \
To install the required plugins and providers for the terraform code present in a current directory. \
**b. terraform plan** \
To dry run the planned architecture before applying on the actual environment.\
