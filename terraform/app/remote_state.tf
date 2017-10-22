terraform {
  backend "s3" {
    bucket = "joujou"
    encrypt = "true"
    key    = "app/app.tfstate"
    region = "us-east-1"
  }
}
