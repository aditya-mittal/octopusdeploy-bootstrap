output "cluster_token" {
  value = data.kubernetes_secret.admin_service_account_secret.data["token"]
}

output "cluster_endpoint" {
  value = data.aws_eks_cluster.eks_cluster.endpoint
}