module "ecr" {
  source = "terraform-aws-modules/ecr/aws"

  repository_name                   = "hello-app"
  create_lifecycle_policy           = false
  repository_read_write_access_arns = ["arn:aws:iam::${var.account_id}:user/arnaud", "arn:aws:iam::${var.account_id}:user/github-workflow"]
  repository_read_access_arns       = [module.eks.eks_managed_node_groups.main.iam_role_arn]
}
# Users have been created in the console.
# In a real setup, they would be handled with SSO and with OIDC for github
