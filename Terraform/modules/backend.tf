terraform {
  backend "s3" {
    bucket         = "backend-terra-hash"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
