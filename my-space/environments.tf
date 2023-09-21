module "dev_env" {
  source      = "../modules/environments"
  description = "Development Environment for ${local.dev_k8s_cluster}"
  name        = "${local.dev_k8s_cluster}_DEVELOPMENT_ENV"
  providers = {
    octopusdeploy = octopusdeploy.space-bootstrapper
  }
}

module "qa_env" {
  source      = "../modules/environments"
  description = "QA Environment for ${local.qa_k8s_cluster}"
  name        = "${local.qa_k8s_cluster}_QA_ENV"
  providers = {
    octopusdeploy = octopusdeploy.space-bootstrapper
  }
}

module "prod_env" {
  source      = "../modules/environments"
  description = "Production Environment for ${local.prod_k8s_cluster}"
  name        = "${local.prod_k8s_cluster}_PRODUCTION_ENV"
  providers = {
    octopusdeploy = octopusdeploy.space-bootstrapper
  }
}