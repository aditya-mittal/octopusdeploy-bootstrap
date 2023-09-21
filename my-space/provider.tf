provider "octopusdeploy" {
  address = local.octopus_endpoint
  api_key = var.octopus_api_key
  alias   = "space-creator"
}

provider "octopusdeploy" {
  address  = local.octopus_endpoint
  api_key  = var.octopus_api_key
  space_id = data.octopusdeploy_space.my_space.id
  alias    = "space-bootstrapper"
}