# create secret manager for your sensitive information 
resource "aws_secretsmanager_secret" "my_secret" {
  name = "my-secret"
}

# create a secret duplicate
resource "aws_secretsmanager_secret_version" "my_secret_version" {
  secret_id = aws_secretsmanager_secret.my_secret.id
  secret_string = jsonencode({
    "username" : "user",
    "password" : "mypassword"
  })
}


# Create RDS for your sensitive aws resources
resource "aws_db_instance" "rds" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  db_name                 = "Testrds003"
  username             = "myuser"
  password             = "mypassword1234"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}
