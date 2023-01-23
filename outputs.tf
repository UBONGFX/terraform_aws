output "ec2-dev_ip" {
  value = aws_instance.ec2-dev.public_ip
}
