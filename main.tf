# Configuring the AWS Provider
provider "aws" {
  region = "${var.region}"
  access_key = ""
  secret_key = ""
}


resource "aws_s3_bucket" "terraform_tf" {
  bucket = "ashutosh-lamp-tf"
}


resource "aws_s3_bucket_versioning" "terraform_tf" {
  bucket = aws_s3_bucket.terraform_tf.id

  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_tf" {
  bucket = aws_s3_bucket.terraform_tf.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}


resource "aws_dynamodb_table" "terraform-lock" {
  name = "ashu-tf-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
      name = "LockID"
      type = "S"
  }
}


module "web" {
  source = "./modules/web"

  key_name = "${var.key_name}"
  subnet_id = "${aws_subnet.tf-web.id}"
  vpc_id = "${aws_vpc.tf-vpc.id}"
}


module "db" {
  source = "./modules/db"

  key_name = "${var.key_name}"
  subnet_id = "${aws_subnet.tf-db.id}"
  vpc_id = "${aws_vpc.tf-vpc.id}"
  sg_tf_web = "${module.web.sg_tf_web}"
}
