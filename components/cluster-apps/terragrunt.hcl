terraform {
  source = "../../tf/cluster-apps" //would usually be a different repo
}

dependency infra {
  config_path = "../infra"
}

inputs = {
  account_id        = "058264537240"
  cluster_endpoint  = dependency.infra.outputs.cluster_endpoint
  cluster_ca_cert   = dependency.infra.outputs.cluster_ca_cert
  cluster_name      = dependency.infra.outputs.cluster_name
  oidc_provider_arn = dependency.infra.outputs.oidc_provider_arn
}
