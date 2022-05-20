//variables
variable    "db_engine"         {}
variable    "db_engine_rev"     {}
variable	  "db_username"       {}
variable    "db_password"       {}
variable    "sec_group"         {}
variable    "instance_size"     {}
variable    "subnet_grp"        {}
#variable    "encryption"        {}
variable    "name"              {}

//Generate RDS instance
resource "aws_db_instance" "_instance" {
  allocated_storage    = 10
  engine               = var.db_engine
  engine_version       = var.db_engine_rev
  instance_class       = var.instance_size
  username             = var.db_username
  password             = var.db_password
  skip_final_snapshot  = true
  db_subnet_group_name = var.subnet_grp
  storage_encrypted    = "true"

  tags = {
    "Name" = "${var.name}"
  }
}

//Outputs
output "address" {
  value                 = aws_db_instance._instance.address
}
