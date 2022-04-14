resource "aws_dynamodb_table_item" "account-request" {
  table_name = var.account-request-table
  hash_key   = var.account-request-table-hash
    for_each = { for combo in var.account_assignment_map : combo.AccountEmail => combo}
  item = jsonencode({
    id = { S = lookup(var.account_assignment_map, "AccountEmail") }
    account_assignment_map = { M = {
      AccountEmail              = { S = lookup(var.account_assignment_map, "AccountEmail") }
      AccountName               = { S = lookup(var.account_assignment_map, "AccountName") }
      ManagedOrganizationalUnit = { S = lookup(var.account_assignment_map, "ManagedOrganizationalUnit") }
      SSOUserEmail              = { S = lookup(var.account_assignment_map, "SSOUserEmail") }
      SSOUserFirstName          = { S = lookup(var.account_assignment_map, "SSOUserFirstName") }
      SSOUserLastName           = { S = lookup(var.account_assignment_map, "SSOUserLastName") }
      }
    }
    change_management_parameters = { M = {
      change_reason       = { S = lookup(var.change_management_parameters, "change_reason") }
      change_requested_by = { S = lookup(var.change_management_parameters, "change_requested_by") }
      }
    }
    account_tags                = { S = jsonencode(var.account_tags) }
    account_customizations_name = { S = var.account_customizations_name }
    custom_fields               = { S = jsonencode(var.custom_fields) }
  })
}