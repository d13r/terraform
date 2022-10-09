# My Terraform Configuration

## Setup

Make sure [Terraform is installed](https://learn.hashicorp.com/tutorials/terraform/install-cli).

```bash
git clone git@github.com:d13r/terraform.git
cd terraform

cp backend.tf.example backend.tf
cp terraform.tfvars.example terraform.tfvars
vim terraform.tfvars backend.tf

terraform apply
```
