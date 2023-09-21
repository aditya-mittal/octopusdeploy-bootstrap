module "space" {
  source              = "../modules/space"
  description         = "Space for ${local.team_name}"
  name                = "${local.team_name}-space"
  space_manager_teams = ["teams-everyone", "teams-administrators"]
  providers = {
    octopusdeploy = octopusdeploy.space-creator
  }
}

#data "octopusdeploy_space" "my_space" {
#  name = "${local.team_name}"
#  provider = octopusdeploy.space-creator
#}