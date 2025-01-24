# AWS Enterprise Landing Zone - Infrastructure as Code (IaC)

Infrastructure code repository demonstrating AWS multi-account setup using Terraform and GitHub Actions.

## Architecture Components

### Account Factory & Organizations
- Organization Management Account
- Account Baseline Pipelines
- Account Lifecycle Management
- OU Structure:
 - Core OU
 - Workload OU
 - Prod OU 
 - Dev OU
 - Sandbox OU

### Workload Accounts
- Production Workload Account
- Development Workload Account
- Testing/Sandbox Account

### Core Infrastructure
- Log Archive Account
 - CloudTrail Archives
 - VPC Flow Logs
 - AWS Config Archives
 - GuardDuty Archives
 - KMS Encryption

- Security Account
 - AWS Security Hub
 - Amazon GuardDuty
 - AWS Config
 - IAM Access Analyzer
 - Amazon Inspector
 - Security Findings

- Connectivity Account
 - Route53 Hosted Zones
 - DNS Resolver Endpoints
 - Transit Gateway
 - VPN Connection
 - Direct Connect
 - Network Firewall
 - Centralized VPCs

### Identity & Access Management
- IAM Identity Center (SSO)
- Permission Sets
- Users & Groups
- Access Controls

Note: Learning/Portfolio project.
