resource "aws_subnet" "sky_subnet_1" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = var.sky_subnet_1_cidr
  availability_zone = "ap-south-1a"

  tags = {
    Name = "${var.vpc1_name}-Pub_Subnet_1"
  }
}

resource "aws_route_table" "vpc1_rt" {
  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc1_igw.id
  }
  tags = {
    Name = "${var.vpc1_name}-RT"
  }
}

resource "aws_subnet" "terra_subnet_1" {
  provider          = aws.seoul
  vpc_id            = aws_vpc.vpc2.id
  cidr_block        = var.terra_subnet_1_cidr
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "${var.vpc2_name}-Pub_Subnet_1"
  }
}

resource "aws_route_table" "vpc2_rt" {
  provider = aws.seoul
  vpc_id   = aws_vpc.vpc2.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc2_igw.id
  }
  tags = {
    Name = "${var.vpc2_name}-RT"
  }
}

resource "aws_route_table_association" "sky_rt_ass" {
  subnet_id      = aws_subnet.sky_subnet_1.id
  route_table_id = aws_route_table.vpc1_rt.id
}

resource "aws_route_table_association" "terra_rt_ass" {
  provider       = aws.seoul
  subnet_id      = aws_subnet.terra_subnet_1.id
  route_table_id = aws_route_table.vpc2_rt.id
}