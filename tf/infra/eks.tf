module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = local.name
  cluster_version = "1.30"

  # EKS Addons
  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }


  enable_irsa = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    main = {
      ami_type       = "BOTTLEROCKET_x86_64"
      instance_types = ["t3.small"]

      min_size     = var.node_group_size
      max_size     = var.node_group_size
      desired_size = var.node_group_size
    }
  }

  cluster_endpoint_public_access = true #would be accessible only through VPN in reality

  access_entries = {
    # One access entry with a policy associated
    admin = {
      kubernetes_groups = []
      principal_arn     = "arn:aws:iam::${var.account_id}:user/arnaud"

      policy_associations = {
        admin = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }

  tags = local.tags
}
