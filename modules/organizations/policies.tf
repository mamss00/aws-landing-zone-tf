# modules/organizations/policies.tf

# Service Control Policies (SCPs) for AWS Organizations
# These policies enforce security baseline across all accounts

# Block AWS root user access across organization
# This is a critical security control to prevent unlimited access
resource "aws_organizations_policy" "deny_root_user" {
 name = "deny-root-user"
 description = "Prevents usage of root user account across organization"
 
 content = jsonencode({
   Version = "2012-10-17"
   Statement = [{
     Effect = "Deny"
     Action = "*"
     Resource = "*" 
     Condition = {
       StringLike = {
         "aws:PrincipalArn": ["arn:aws:iam::*:root"]
       }
     }
   }]
 })

 tags = {
   Purpose = "Security Baseline"
   Type    = "Preventive Control"
 }
}

# Enforce MFA usage for all IAM users
# Requires MFA for all actions except enabling MFA itself
resource "aws_organizations_policy" "require_mfa" {
 name = "require-mfa"
 description = "Enforces MFA usage for all IAM users"
 
 content = jsonencode({
   Version = "2012-10-17"
   Statement = [{
     Effect = "Deny"
     NotAction = [
       "iam:CreateVirtualMFADevice",  # Allow creating MFA device
       "iam:EnableMFADevice"          # Allow enabling MFA
     ]
     Resource = "*"
     Condition = {
       BoolIfExists = {
         "aws:MultiFactorAuthPresent": "false"
       }
     }
   }]  
 })

 tags = {
   Purpose = "Security Baseline"
   Type    = "Preventive Control"
 }
}

# Attach deny root policy to all OUs
# This ensures the policy is enforced across the entire organization
resource "aws_organizations_policy_attachment" "deny_root_user" {
 for_each = aws_organizations_organizational_unit.ous
 
 policy_id = aws_organizations_policy.deny_root_user.id
 target_id = each.value.id
}