//variables
variable  "ssh_key"       {}
variable	"region"        {}
variable	"ami"           {}
variable	"name"          {}
variable  "sec_group"     {}
variable  "instance_size" {}
variable  "subnet"        {}

resource "aws_network_interface" "nic" {
  subnet_id   = var.subnet

  tags = {
    Name = "primary_network_interface"
  }
}

//Generate EC2 instance
resource "aws_instance" "server" {
  ami                     = var.ami
  instance_type           = var.instance_size
  key_name                = var.ssh_key
  vpc_security_group_ids  = var.sec_group
  subnet_id               = var.subnet
#  network_interface {
#    device_index          = 0
#    network_interface_id  = aws_network_interface.nic.id
#  }
  tags = {
    Name  = var.name
  }
}

//Outputs
output "ip" {
  value                 = aws_instance.server.private_ip
}
