# Creating the vpc
resource "aws_vpc" "tf-vpc" {
  cidr_block = "172.21.0.0/16"
  
  tags = {
  Name = "TF VPC - Lamp"
  }
}

# Creating Subnet-1
resource "aws_subnet" "tf-web" {
  vpc_id = "${aws_vpc.tf-vpc.id}"
  cidr_block = "172.21.0.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true
  
  tags = {
  Name = "tf-web"
  }
}

# Creating Subnet-2
resource "aws_subnet" "tf-db" {
  vpc_id = "${aws_vpc.tf-vpc.id}"
  cidr_block = "172.21.1.0/24"
  availability_zone = "ap-south-1b"
  
  tags = {
  Name = "tf-db"
  }
}

# Creating Internet gateway
resource "aws_internet_gateway" "igw_tf" {
  vpc_id = "${aws_vpc.tf-vpc.id}"

  tags = {
  Name = "TF - IGW"
  }
}

# Creating Route table
resource "aws_route" "rt_tf_web" {
  route_table_id         = "${aws_vpc.tf-vpc.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.igw_tf.id}"
}
