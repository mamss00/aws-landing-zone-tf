# Specify required versions for Terraform and providers
# AWS provider >= 4.0.0 needed for Organizations and Control Tower features
terraform {
 required_version = "~> 1.10.0"  # Compatible with 1.10.x
 required_providers {
   aws = {
     source  = "hashicorp/aws"
     version = "~> 5.84.0"  # Compatible with 5.84.x
   }
 }
}