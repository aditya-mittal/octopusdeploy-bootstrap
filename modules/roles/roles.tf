resource "octopusdeploy_user_role" "role" {
  can_be_deleted            = false
  description               = var.description
  granted_space_permissions = var.developer_role_space_permissions
  name                      = var.name
}