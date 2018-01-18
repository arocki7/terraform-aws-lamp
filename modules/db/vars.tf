variable "ami" {
  default = "ami-1a962263"
}

variable "key_name" {
  default = "arocki7"
}

variable "subnet_id" {
  description = "Subnet ID information for the Web servers."
}

variable "vpc_id" {
  description = "VPC ID information for TF servers."
}
