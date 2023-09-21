data "octopusdeploy_user_roles" "developer_role" {
  partial_name = var.developer_role_partial_name
}

resource "octopusdeploy_team" "development_team" {
  name               = var.development_team_name
  can_change_members = true
  description        = var.development_team_description
  space_id           = var.space_id
  user_role {
    space_id     = var.space_id
    user_role_id = data.octopusdeploy_user_roles.developer_role.user_roles[0].id
  }
}