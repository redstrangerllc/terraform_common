//variables
variable  "ssh_key"       {}
variable  "region"        {}
variable  "ami"           {}
variable  "domain"        {}
variable  "sec_group"     {}
variable  "instance_size" {}
variable  "subnet"        {}
variable  "name"          {}
variable  "iam_role"      {}

//Generate EC2 instance
resource "aws_instance" "server" {
  ami                     = var.ami
  instance_type           = var.instance_size
  key_name                = var.ssh_key
  vpc_security_group_ids  = var.sec_group
  subnet_id               = var.subnet
  iam_instance_profile    = var.iam_role
  
  tags = {
    Name = var.name
  }

}

//Generate elastic IP
resource "aws_eip" "ip" {
  instance              = aws_instance.server.id
}

//Outputs
output "ip" {
  value                 = aws_eip.ip.public_ip
}
output "ami" {
  value                 = var.ami
}
