# EC2 Instance
resource "aws_instance" "EC2Jenkins" {
  ami = data.aws_ami.amzlinux2.id
  instance_type = var.instance_type
  user_data = file("${path.module}/init_jenkins.sh")
  key_name = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.vpc_ssh.id, aws_security_group.vpc-web.id]
  tags = {
    Name = "Jenkins"
  }
}