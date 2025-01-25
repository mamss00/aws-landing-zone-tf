# Initialize AWS Organizations with all features enabled
# This allows Service Control Policies, Tag Policies, etc.
resource "aws_organizations_organization" "main" {
  feature_set = "ALL" # Enable all AWS Organizations features

  # Enable policy types needed for governance
  enabled_policy_types = [
    "SERVICE_CONTROL_POLICY", # For access control
    "TAG_POLICY"              # For resource tagging standards
  ]
}

# Create Organizational Units (OUs) based on enterprise structure
# Each OU can contain accounts and sub-OUs for different purposes
resource "aws_organizations_organizational_unit" "ous" {
  for_each  = var.organizational_units
  name      = each.value
  parent_id = aws_organizations_organization.main.roots[0].id # Attach to root

  # Tags for resource tracking and management
  tags = {
    ManagedBy = "Terraform" # Infrastructure as Code identifier
    OUType    = each.key    # OU category (core, workload, etc)
    Purpose   = "Organization Management"
  }
}
