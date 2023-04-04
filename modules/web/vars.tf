variable "ami" {
  default = "ami-01a4f99c4ac11b03c"
}

variable "key_name" {
  description = "SSH Key used for the servers."
}

variable "subnet_id" {
  description = "Subnet ID information for the Web servers."
}

variable "vpc_id" {
  description = "VPC ID information for TF servers."
}
