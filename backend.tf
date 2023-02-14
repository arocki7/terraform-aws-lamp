terraform {
  backend "s3" {
    bucket = "ashutosh-lamp-tf"
    key = ""
    region = "ap-south-1"
    dynamodb_table = "ashu-tf-lock"
    encrypt = true
  }
}
