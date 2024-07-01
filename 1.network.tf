resource "aws_vpc" "vpc1" {
  cidr_block           = var.vpc1_cidr
  enable_dns_hostnames = "true"
  tags = {
    Name  = var.vpc1_name
    Owner = var.vpc1_owner
  }
  lifecycle {
    ignore_changes = [
      tags,
    ]
  }
}


resource "aws_internet_gateway" "vpc1_igw" {
  vpc_id = aws_vpc.vpc1.id
  tags = {
    Name = "${var.vpc1_name}-IGW"
  }
}

#Seoul region 

resource "aws_vpc" "vpc2" {
  provider             = aws.seoul
  cidr_block           = var.vpc2_cidr
  enable_dns_hostnames = "true"
  tags = {
    Name  = var.vpc2_name
    Owner = var.vpc2_owner
  }
}

resource "aws_internet_gateway" "vpc2_igw" {
  provider = aws.seoul
  vpc_id   = aws_vpc.vpc2.id
  tags = {
    Name = "${var.vpc2_name}-IGW"
  }
}