remote_state {
  backend = "s3"
  config = {
    encrypt        = true
    bucket         = "arnaud-ah-tf-states"
    key            = "${path_relative_to_include()}/tf.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "tf-locks"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}
