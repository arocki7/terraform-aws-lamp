# Creating DynamoDB & S3 as remote backend
terraform {
 backend "s3" {
 encrypt = true
 bucket = "ashutosh.tfstate"
 dynamodb_table = "ashutf"
 region = "ap-south-1"
 key = "terraform-lamp.tfstate"
 }
}
