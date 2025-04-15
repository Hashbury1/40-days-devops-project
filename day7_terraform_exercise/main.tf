resource "aws_instance" "docker-server" {
  ami           = var.ami_id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_vpc" "docker_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_subnet" "pub_subnet" {
  vpc_id            = aws_vpc.docker_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "tf-pub"
  }
}

resource "aws_subnet" "pri_subnet" {
  vpc_id            = aws_vpc.docker_vpc.id
  cidr_block        = "172.16.11.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "tf-example"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.docker_vpc.id

  tags = {
    Name = "allow_tls"
  }
}


