# variables.tf in azure_policy module

# CIS Policy Set ID for CIS 2.0
variable "cis_policy_set_id" {
  description = "Policy set definition ID for CIS 2.0"
  type        = string
}

# Management Group ID for policy assignment scope
variable "management_group_id" {
  description = "Management group ID where the policies will be assigned"
  type        = string
}

# Maximum days to rotate keys for CIS compliance
variable "maximum_days_to_rotate" {
  description = "Maximum number of days to rotate keys for CIS compliance."
  type        = number
  default     = 90  # Set a default value or override in terraform.tfvars
}

# Optional tags for policy assignments
variable "policy_tags" {
  description = "Tags to apply to the policy assignments"
  type        = map(string)
  default     = {
    environment = "production"
    deployment  = "terraform"
  }
}

# Placeholder for additional policy variables
# variable "additional_policy_id" {
#   description = "Policy definition ID for an additional policy"
#   type        = string
# }
# variable "additional_policy_assignment_name" {
#   description = "Assignment name for the additional policy"
#   type        = string
# }
# variable "additional_policy_parameters" {
#   description = "Parameters for the additional policy"
#   type        = map(any)
#   default     = {}
# }
