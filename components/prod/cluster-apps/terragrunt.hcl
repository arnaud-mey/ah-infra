terraform {
  source = "../../../tf/cluster-apps" //would usually be a different repo
}

dependency infra {
  config_path = "../infra"
}

inputs = {
  account_id        = include.env.locals.account_id
  region            = include.env.locals.region
  cluster_endpoint  = dependency.infra.outputs.cluster_endpoint
  cluster_ca_cert   = dependency.infra.outputs.cluster_ca_cert
  cluster_name      = include.env.locals.cluster_name
  oidc_provider_arn = dependency.infra.outputs.oidc_provider_arn
  environment       = include.env.locals.environment
}

include "env" {
  path   = find_in_parent_folders("env.hcl")
  expose = true
}
