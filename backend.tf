terraform {
  backend "s3" {
    bucket = "ashutosh-lamp-tf"
    key = "global/s3/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "ashu-tf-lock"
    encrypt = true
  }
}
