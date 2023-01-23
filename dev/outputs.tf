output "ec2-dev_ip" {
  value = aws_instance.ec2-instance.public_ip
}
