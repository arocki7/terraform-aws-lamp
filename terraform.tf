terraform {
 backend "s3" {
 encrypt = true
 bucket = "arocki.tfstate"
 dynamodb_table = "arockitf"
 region = "eu-west-1"
 key = "terraform-lamp.tfstate"
 }
}
