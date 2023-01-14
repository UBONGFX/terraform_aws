provider "aws" {
  region = "eu-central-1"

}

resource "aws_instance" "ec2-dev" {
  ami                    = "ami-0039da1f3917fa8e3"
  instance_type          = "t3.nano"
  vpc_security_group_ids = ["sg-09b375415c4fc1768"]
  subnet_id              = "subnet-0a890b1d4fb6de4e4"
  tags = {
    Name = "ec2-dev"
  }
}
