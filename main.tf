# Configuring the AWS Provider
provider "aws" {
  region = "${var.region}"
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
