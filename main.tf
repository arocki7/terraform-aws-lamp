# Configure the AWS Provider
provider "aws" {
  region = "${var.region}"
}

module "web" {
  source = "modules/web"

  subnet_id = "${aws_subnet.tf-web.id}"
  vpc_id = "${aws_vpc.tf-vpc.id}"
}

module "db" {
  source = "modules/db"

  subnet_id = "${aws_subnet.tf-db.id}"
  vpc_id = "${aws_vpc.tf-vpc.id}"
}
