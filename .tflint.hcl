# AWS provider configuration
plugin "aws" {
  enabled = true
  version = "0.30.0"
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

# Enforce required tags on AWS resources
rule "aws_resource_missing_tags" {
  enabled = true
  tags    = ["Environment", "Owner", "Project"]
}

# Enforce consistent naming conventions
rule "terraform_naming_convention" {
  enabled = true
}
