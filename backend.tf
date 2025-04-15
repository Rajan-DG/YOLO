terraform {
  backend "s3" {
    bucket         = "terraform-state-rdg"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-Raj"
    encrypt        = true
  }
}

