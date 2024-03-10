module "eks" {
  source                         = "terraform-aws-modules/eks/aws"
  version                        = "20.8.2"
  cluster_name                   = var.cluster_name
  cluster_version                = "1.29"
  subnet_ids                     = module.vpc.private_subnets
  cluster_endpoint_public_access = true
  vpc_id                         = module.vpc.vpc_id

  eks_managed_node_groups = {
    eks_nodes = {
      min_size      = 2
      max_size      = 4
      desired_size  = 2
      instance_type = "t3a.micro"
    }
  }
  enable_cluster_creator_admin_permissions = true
}
//kubeapi (whether directly or by a load balancer (we don't know it is managed by aws))
output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}
//if we need for creating the policy and role and attach it to a pod or anything using the k8s's identity provider (directory)
output "cluster_oidc_issuer_url" {
  value = module.eks.cluster_oidc_issuer_url
}
