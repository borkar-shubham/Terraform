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
**_Write --> Init --> Plan --> Apply --> Destroy_** \
**a. Write** \
Write or modify the code to create and change the infrastructure. \
**b. Init** \
Download and install the required plugins and providers according to the terraform code present in a current directory. \
**c. Plan** \
Review and dry run the planned architecture before applying on the actual environment. \
**d. Apply** \
Accept the changes and implement them in actual environment. \
**e. Destroy** \
Remove or destroy all the infrastructure that were made by the Terraform.
## Terraform Commands
These are the basic commands used in Terraform Administration.
```
terraform init 
```
It initiates a terraform plugin required by the infra code.
```
terraform plan
```
To show the changes that will be made to the cloud after apply.
```
terraform validate
```
Check if the configurations made are proper or not.
```
terraform apply
```
Applies the configuration to the cloud.
```
terraform distroy
```
Distroy the configuration made in cloud
```
terraform refresh
```
Refresh the configuration in tfstate file with the actual environment.
```
terraform show
```
Shows the content of tfstate file
```
terraform output
```
Prints the configured output results.
```
terraform console
```
It takes into the terraform command line.
```
terraform fmt
```
It makes the terraform code aligned and indented.
```
terraform taint <resource-type> <resource-name>
```
It marks the resource as a taint and replaces it in next apply instead of updating it. \
_Note: Terraform do not recomends the taint command, use "terraform apply --replace" instead._
