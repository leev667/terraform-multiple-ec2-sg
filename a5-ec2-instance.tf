# EC2 Instance
resource "aws_instance" "semiramis2vm" {
  ami = data.aws_ami.this.id
  instance_type = var.instance_type
  count = 3
  user_data = file("${path.module}/webapp-userdata-instance.sh")
  key_name = var.instance_keypair
  vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id ]
  tags = {
    "Name" = "Semiramis Instance-${count.index}"
  }
}
