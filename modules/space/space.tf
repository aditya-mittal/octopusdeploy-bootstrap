resource "octopusdeploy_space" "space" {
  name                 = var.name
  description          = var.description
  space_managers_teams = var.space_manager_teams
}