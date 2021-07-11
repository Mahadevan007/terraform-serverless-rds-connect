resource "aws_ssm_parameter" "endpoint" {
  name        = "/database/myDemoDB/endpoint"
  description = "Endpoint to connect to the myDemoDB database"
  type        = "SecureString"
  value       = aws_db_instance.demo-mysql-rds.address
}

resource "aws_ssm_parameter" "user" {
  name        = "/database/myDemoDB/user"
  description = "Name of the myDemoDB database"
  type        = "SecureString"
  value       = var.username
}

resource "aws_ssm_parameter" "password" {
  name        = "/database/myDemoDB/password"
  description = "Password to the myDemoDB database"
  type        = "SecureString"
  value       = var.password
}

resource "aws_ssm_parameter" "name" {
  name        = "/database/myDemoDB/name"
  description = "Name of the myDemoDB database"
  type        = "SecureString"
  value       = "myDemoDB"
}
