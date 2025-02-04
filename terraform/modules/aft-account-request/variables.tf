variable "account-request-table" {
  type        = string
  description = "name of account-request-table"
  default     = "aft-request"
}

variable "account-request-table-hash" {
  type        = string
  description = "name of account-request-table hash key"
  default     = "id"
}

variable "control_tower_parameters" {
  # type = object({
  #   AccountEmail              = string
  #   AccountName               = string
  #   ManagedOrganizationalUnit = string
  #   SSOUserEmail              = string
  #   SSOUserFirstName          = string
  #   SSOUserLastName           = string
  # })
}

variable "change_management_parameters" {
  type = object({
    change_requested_by = string
    change_reason       = string
  })
  default = {
    change_reason = "na"
    change_requested_by = "na"
  }
}

variable "account_tags" {
  type        = map(any)
  description = "map of account-level tags"
  default = {}
}

variable "custom_fields" {
  type        = map(any)
  description = "map of custom fields defined by the customer"
  default     = {}
}

variable "account_customizations_name" {
  type        = string
  default     = null
  description = "The name of the account customizations to apply"
}

# variable "account_assignment_map" {
#   # type = object({
#   #   AccountEmail              = string
#   #   AccountName               = string
#   #   ManagedOrganizationalUnit = string
#   #   SSOUserEmail              = string
#   #   SSOUserFirstName          = string
#   #   SSOUserLastName           = string
#   # })
# }