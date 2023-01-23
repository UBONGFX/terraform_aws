provider "aws" {
  region = "eu-central-1"
}

resource "aws_security_group" "sg-hood" {
  name        = var.sg_name
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


resource "aws_instance" "ec2-instance" {
  ami                         = "ami-03e08697c325f02ab"
  instance_type               = var.ec2_instance_type
  vpc_security_group_ids      = ["sg-0341f3d16d4abdf27"]
  key_name                    = var.key_name
  associate_public_ip_address = true
  tags = {
    Name = var.ec2_name
  }

  provisioner "remote-exec" {

    inline = ["echo 'Wait until ssh is ready'"]

    connection {
      type        = "ssh"
      user        = var.ssh_user
      private_key = file(var.private_key_path)
      host        = aws_instance.ec2-instance.public_ip
    }
  }

  provisioner "local-exec" {
    command = "cd ../ansible && ansible-playbook -i ${aws_instance.ec2-instance.public_ip}, --private-key ${var.private_key_path} --user ${var.ssh_user} ../ansible/playbooks/deploy.yaml"
  }
}
