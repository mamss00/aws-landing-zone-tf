# Export Organization identifiers for use in other modules
output "organization_id" {
 description = "AWS Organization ID - Used for resource policies and Cross-Account access"
 value       = aws_organizations_organization.main.id
}

output "organization_arn" {
 description = "AWS Organization ARN - Used for IAM policies and resource sharing"
 value       = aws_organizations_organization.main.arn
}

output "ou_ids" {
 description = "Map of OU names to their IDs - Required for account assignments"
 value       = { for k, v in aws_organizations_organizational_unit.ous : k => v.id }
}

output "root_id" {
 description = "Organization Root ID - Parent for all OUs and accounts"
 value       = aws_organizations_organization.main.roots[0].id
}