provider "aws" {
  region = var.infra-region
}

resource "aws_vpc" "MyVPC" {
  cidr_block           = var.vpc-cidr-block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "Main Infra-Prod"
  }
}

resource "aws_iam_role" "Lambda_exec" {
  name = "Lambda_exec_role_CI"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })

}

resource "aws_instance" "MyInstance1" {
  count                       = 2
  ami                         = var.ami-ec2-instance
  instance_type               = var.instance-type
  subnet_id                   = aws_subnet.public_subnet[count.index].id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.MySecurityGroup_sg.id]
  tags = {
    Name = "MyInstance_${count.index}"
  }
}

#Create the two public subnets in the VPC with two different ip addresses
resource "aws_subnet" "public_subnet" {
  count                   = 2
  vpc_id                  = aws_vpc.MyVPC.id
  cidr_block              = element(var.public-subnet-cidrs, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "Public_Subnet_${count.index}"
  }
}

resource "aws_security_group" "MySecurityGroup_sg" {
  name        = "MySecurityGroup-sg"
  description = "Allow HTTP and SSH traffic"
  vpc_id      = aws_vpc.MyVPC.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sub-security-group"
  }

}