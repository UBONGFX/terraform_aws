variable "sg_name" {
  default = "hood-dev-sg"
}

variable "ec2_name" {
  default = "ec2-dev"
}

variable "ec2_instance_type" {
  default = "t3.nano"
}

variable "ssh_user" {
  default = "ubuntu"
}

variable "key_name" {
  default = "admin-dev-test"
}

variable "private_key_path" {
  default = "~/.ssh/admin-dev-test.pem"
}
