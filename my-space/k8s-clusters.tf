locals {
  #eur region cluster
  dev_k8s_cluster = "dev-eks-k8s-cluster"
  qa_k8s_cluster  = "qa-eks-k8s-cluster"
  prod_k8s_cluster = "prod-eks-k8s-cluster"
}

module "dev_cluster" {
  source                    = "../modules/k8s_auth_token"
  cluster_name              = local.dev_k8s_cluster
  service_account_name      = "admin-user"
  service_account_namespace = "kube-system"
}

module "qa_cluster" {
  source                    = "../modules/k8s_auth_token"
  cluster_name              = local.qa_k8s_cluster
  service_account_name      = "admin-user"
  service_account_namespace = "kube-system"
}

module "prod_cluster" {
  source                    = "../modules/k8s_auth_token"
  cluster_name              = local.prod_k8s_cluster
  service_account_name      = "admin-user"
  service_account_namespace = "kube-system"
}