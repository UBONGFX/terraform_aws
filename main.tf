provider "aws" {
  region = "eu-central-1"

}
# V1
# resource "aws_instance" "ec2-dev" {
#   ami                         = "ami-0039da1f3917fa8e3"
#   instance_type               = "t3.nano"
#   vpc_security_group_ids      = ["sg-09b375415c4fc1768"]
#   subnet_id                   = "subnet-0a890b1d4fb6de4e4"
#   key_name                    = "admin-dev-test"
#   associate_public_ip_address = true
#   tags = {
#     Name = "ec2-dev"
#   }
# }

resource "aws_security_group" "example" {
  name        = "hood-dev"
  description = "Allow specific inbound and all outbound traffic"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}


resource "aws_instance" "ec2-dev" {
  ami                    = "ami-03e08697c325f02ab" #ami-0a261c0e5f51090b1 ami-0039da1f3917fa8e3
  instance_type          = "t3.nano"
  vpc_security_group_ids = ["sg-0341f3d16d4abdf27"]
  #   vpc_security_group_ids = [aws_security_group.example.id]
  #   subnet_id                   = "subnet-0099b2c013769a3ff"
  key_name                    = "admin-dev-test"
  associate_public_ip_address = true
  tags = {
    Name = "ec2-dev"
  }
}
