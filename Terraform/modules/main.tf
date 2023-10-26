# VPC module config
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "terraform"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]


  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
#

# EC2 instance config
module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type          = "t2.micro"
  key_name               = "nv-django.pem"
  monitoring             = true
  vpc_security_group_ids = ["sg-0a0719f26d0a5bbb4"]
  subnet_id              = "subnet-0157a53775d8448f7"
  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

# define security group setting
module "security-group" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name        = "web-server"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["10.10.0.0/16"]
}

# output for security group
output "security-group" {
  value = module.security-group.security_group_id
}

# database RDS instance config

module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "demodb"

  engine            = "mysql"
  engine_version    = "5.7"
  instance_class    = "db.t3.micro"
  allocated_storage = 5

  db_name  = "testdb"
  username = "user"
  port     = "3306"

  iam_database_authentication_enabled = true

  vpc_security_group_ids = ["sg-0a0719f26d0a5bbb4"]
  
  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically

  tags = {
    Owner       = "for prod"
    Environment = "dev"
  }

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = var.subnet_id
  # DB parameter group
  family = "mysql5.7"

  # DB option group
  major_engine_version = "5.7"
}


