terraform {
  source = "../../tf/infra" //would usually be a different repo
}

inputs = {
  env             = "prod"
  region          = "eu-central-1"
  account_id      = "058264537240"
  node_group_size = 5
}
