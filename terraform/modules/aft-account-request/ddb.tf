resource "aws_dynamodb_table_item" "account-request" {
  table_name = var.account-request-table
  hash_key   = var.account-request-table-hash
    for_each = { for combo in var.account_assignment_map : combo.AccountEmail => combo}
  item = jsonencode({
    id                        = [each.value].AccountEmail
    AccountEmail              = [each.value].AccountEmail
    AccountName               = [each.value].AccountName
    ManagedOrganizationalUnit = [each.value].ManagedOrganizationalUnit
    SSOUserEmail              = [each.value].SSOUserEmail
    SSOUserFirstName          = [each.value].SSOUserFirstName
    SSOUserLastName           = [each.value].SSOUserLastName
    change_management_parameters = { M = {
      change_reason       =  lookup(var.change_management_parameters, "change_reason") 
      change_requested_by =  lookup(var.change_management_parameters, "change_requested_by") 
      }
    }
    account_tags                = jsonencode(var.account_tags)
    account_customizations_name = [each.value].account_customizations_name
    custom_fields               = jsonencode(var.custom_fields)
  })
}