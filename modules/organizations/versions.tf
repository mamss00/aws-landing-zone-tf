# Specify required versions for Terraform and providers
# AWS provider >= 4.0.0 needed for Organizations and Control Tower features
terraform {
 required_version = ">= 1.0.0"
 required_providers {
   aws = {
     source  = "hashicorp/aws"
     version = ">= 4.0.0"
   }
 }
}