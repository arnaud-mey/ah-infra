terraform {
  source = "../../../tf/infra" //would usually be a different repo
}

inputs = {
  environment     = include.env.locals.environment
  region          = include.env.locals.region
  account_id      = include.env.locals.account_id
  node_group_size = include.env.locals.node_group_size
  cluster_name    = include.env.locals.cluster_name
}

include "env" {
  path   = find_in_parent_folders("env.hcl")
  expose = true
}
