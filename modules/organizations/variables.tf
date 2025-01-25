# Core organization configuration variables
# Organizational Units structure follows AWS best practices for enterprise accounts
variable "organizational_units" {
  description = "Map of OU names and their display names for AWS Organization structure"
  type        = map(string)
  default = {
    core     = "Core"        # For shared services accounts
    workload = "Workload"    # Parent OU for workload accounts
    prod     = "Production"  # Production workload accounts
    dev      = "Development" # Development workload accounts
    sandbox  = "Sandbox"     # Testing and experimentation
  }
}

# Control Tower enablement flag
# When true, sets up Control Tower guardrails and compliance
/* variable "enable_control_tower" {
  description = "Enable AWS Control Tower and its governance features"
  type        = bool
  default     = true
} */
