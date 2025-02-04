locals {
control_tower_parameters = csvdecode (file("./accounts.csv"))
}

# module "test1" {
#   source = "./modules/aft-account-request"

#   control_tower_parameters = {
#     AccountEmail              = "AFT-MemberTest1LAB.AcctAwsPrg@progleasing.com"
#     AccountName               = "AFT-MemberTest1LAB"
#     ManagedOrganizationalUnit = "AFT-LZ (ou-4nab-cmm3u75a)"
#     SSOUserEmail              = "AFT-MemberTest1LAB.AcctAwsPrg@progleasing.com"
#     SSOUserFirstName          = "AFT"
#     SSOUserLastName           = "MemberTest1LAB"
#   }

#   account_tags = {
#     "Learn Tutorial" = "AFT"
#   }

#   change_management_parameters = {
#     change_requested_by = "AaronB"
#     change_reason       = "Learn AWS Control Tower Account Factory for Terraform"
#   }

#   custom_fields = {
#     group = "non-prod1"
#   }

#   account_customizations_name = "sandbox"
# }


module "accountlist" {
  source = "./modules/aft-account-request"
  control_tower_parameters = local.control_tower_parameters
}