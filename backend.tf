terraform {
  backend "s3" {
    key    = "tfstate-terraform-mybucket"
    region = "us-east-1"
  }
}