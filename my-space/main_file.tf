locals {
  team_name = "my-team-name"
  octopus_endpoint = "https://my.octopus.app/"
  octopus_space_id            = module.space.space_id
  helm_feed_uri               = "https://my.jfrog.io/artifactory/api/helm/my-helm-repo-virtual"
  helm_feed_username          = "my-helm-user"
  developer_role_partial_name = "Developer"
}
module "octopus_space_bootstrap" {
  providers = {
    octopusdeploy = octopusdeploy.space-bootstrapper
  }
  source                = "../modules/space_bootstrap"
  space_id              = local.octopus_space_id
  helm_feed_name        = "${local.team_name}-helm-feed"
  helm_feed_password    = var.helm_feed_password
  helm_feed_uri         = local.helm_feed_uri
  helm_feed_username    = local.helm_feed_username

  clusters = tomap({
    (local.dev_k8s_cluster) = {
      endpoint               = module.dev_cluster.cluster_endpoint
      token_value            = module.dev_cluster.cluster_token
      token_name             = "${local.dev_k8s_cluster}-eks-token"
      deployment_target_name = "${local.dev_k8s_cluster}-deployment-target"
      environment_ids        = [module.dev_env.environment_id]
    },
    (local.qa_k8s_cluster) = {
      endpoint               = module.qa_cluster.cluster_endpoint
      token_value            = module.qa_cluster.cluster_token
      token_name             = "${local.qa_k8s_cluster}-eks-token"
      deployment_target_name = "${local.qa_k8s_cluster}-deployment-target"
      environment_ids        = [module.dev_env.environment_id,module.qa_env.environment_id]
    },
    (local.prod_k8s_cluster) = {
      endpoint               = module.prod_cluster.cluster_endpoint
      token_value            = module.prod_cluster.cluster_token
      token_name             = "${local.prod_k8s_cluster}-eks-token"
      deployment_target_name = "${local.prod_k8s_cluster}-deployment-target"
      environment_ids        = [module.prod_env.environment_id]
    }
  })

  deployment_target_roles = ["${local.team_name}-servers"]
  developer_role_partial_name  = local.developer_role_partial_name
  development_team_description = "Development team for ${local.team_name}"
  development_team_name        = "${local.team_name}-development-team"

}