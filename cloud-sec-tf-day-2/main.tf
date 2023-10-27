# create VPC config
resource "aws_vpc" "devops" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true


  tags = {
    Name = "devops-project"
  }
}

# create pub subnet
resource "aws_subnet" "pub_subnet" {
  vpc_id            = aws_vpc.devops.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "pub-sub"
  }
}

# my private subnet
resource "aws_subnet" "priv_subnet" {
  vpc_id            = aws_vpc.devops.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "Priv-test"
  }
}

# create my ec2 instance
resource "aws_instance" "server" {
  instance_type     = "t2.micro"
  availability_zone = "us-east-1b"
  ami               = var.aws_ami
  subnet_id         = var.subnet_id

  # my iam instance profile
  iam_instance_profile = aws_iam_instance_profile.iam_ec2.name


  tags = {
    Name = "for-devops-test"
  }
}

# resource "aws_flow_log" "vpc_log" {
#   iam_role_arn          = aws_iam_role.vpc_log
#   log_destination       = "arn:aws:logs:us-east-1:123456789012:log-group:/flow-logs"
#   traffic_type          = "ALL"
#   vpc_id                = aws_vpc.devops.id
# }


# where my VPC flow logs are being stored 
resource "aws_cloudwatch_log_group" "cloudwatch" {
  name = "/flow-logs" # The name of your log group
}