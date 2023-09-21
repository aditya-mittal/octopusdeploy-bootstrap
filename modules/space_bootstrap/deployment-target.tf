resource "octopusdeploy_token_account" "token" {
  for_each     = var.clusters
  name         = each.value.token_name
  token        = each.value.token_value
  environments = each.value.environment_ids
}

resource "octopusdeploy_kubernetes_cluster_deployment_target" "k8s_deployment_target" {
  for_each              = var.clusters
  cluster_url           = each.value.endpoint
  environments          = each.value.environment_ids
  name                  = each.value.deployment_target_name
  roles                 = var.deployment_target_roles
  skip_tls_verification = true

  authentication {
    account_id = octopusdeploy_token_account.token[each.key].id
  }
}