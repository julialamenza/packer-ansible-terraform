terraform {
  backend "s3" {
    bucket  = "joujou"
    encrypt = "true"
    key     = "vpc/vpc.tfstate"
    region  = "us-east-1"
  }
}
