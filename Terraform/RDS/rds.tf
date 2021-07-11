# create a mysql RDS Instance
resource "aws_db_instance" "demo-mysql-rds" {
  identifier        = "mysqldatabase"
  storage_type      = "gp2" #optional - One of "standard" (magnetic), 'gp2' (general purpose) SSD, "IO1" provisional items
  allocated_storage = 20    # (Required = unless a snapshot identifier or replicate source db is provided and the allocated storage is in gb bytes)
  engine            = "mysql"
  engine_version    = "8.0"         # Optional - The engine to use
  instance_class    = "db.t2.micro" # required
  # The name of the DB Subnet. The DB instance will be created in the VPC associated with the DB Subnet
  name                   = "myDemoDB" # Optional name of the DB when the instance is created
  username               = var.username
  password               = var.password
  parameter_group_name   = "default.mysql8.0" #optional - the name of the DB parameter group to associate
  multi_az               = false
  publicly_accessible    = true # Optional - a boolean to control if the instance is publicly accessible, default is false.
  deletion_protection    = true # Optional
  skip_final_snapshot    = true # if false is specified, a DB Snapshot is created before the DB instance is deleted
  db_subnet_group_name   = module.vpc.database_subnet_group
  vpc_security_group_ids = ["${aws_security_group.main.id}"]
  tags = {
    name = "Demo MySQL RDS Instance" #Optional - a map of tags to assign to a resource
  }
}


# output "rds" {
#   value     = aws_db_instance.demo-mysql-rds
#   sensitive = true
# }
