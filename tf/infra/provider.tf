provider "aws" {
  region              = local.region
  allowed_account_ids = [var.account_id]
}

