data "aws_eks_cluster" "eks_cluster" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "eks_cluster_auth" {
  name = var.cluster_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks_cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks_cluster.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks_cluster_auth.token
}

data "kubernetes_service_account" "admin_service_account" {
  metadata {
    name      = var.service_account_name
    namespace = var.service_account_namespace
  }
}

data "kubernetes_secret" "admin_service_account_secret" {
  metadata {
    name      = data.kubernetes_service_account.admin_service_account.default_secret_name
    namespace = var.service_account_namespace
  }
}