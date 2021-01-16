#s3://ino1-terraform/tf_state_management/

terraform {
  backend "s3" {
    bucket = "ino1-terraform"
    key    = "tf_state_management/terraform.tfstate"
    region = "ap-south-1"
  }
}