# EC2 Instance Public IP
output "Instance_publicIP" {
  description = "EC2 Jenkins Public IP"
  value = aws_instance.EC2Jenkins
}
# EC2 Instance Public DNS
output "Instance_publicDNS" {
    description = "EC2 Jenkins public DNS"
    value = aws_instance.EC2Jenkins.public_dns
}
