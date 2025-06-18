output "kubeconfig" {
  description = "EKS kubeconfig access details"
  value = {
    cluster_name = module.eks.cluster_name
    endpoint     = module.eks.cluster_endpoint
    ca_data      = module.eks.cluster_certificate_authority_data
  }
}

output "cluster_name" {
  description = "EKS Cluster name"
  value       = module.eks.cluster_name
}

output "node_role" {
  description = "IAM role name for worker nodes"
  value       = module.eks.eks_managed_node_groups.default.iam_role_name
}

