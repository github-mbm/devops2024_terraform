data "aws_vpc" "mango-vpc" {
  id = "vpc-01d222a805afa55e8"
}

resource "aws_vpc_peering_connection" "mango-peering" {
  peer_vpc_id = data.aws_vpc.mango-vpc.id
  vpc_id      = aws_vpc.vpc1.id
  auto_accept = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }
}

resource "aws_vpc_peering_connection_accepter" "mango-accepter" {
  vpc_peering_connection_id = aws_vpc_peering_connection.mango-peering.id
  auto_accept               = true
  tags = {
    Side = "Accepter"
  }
}

resource "aws_route" "sky-to-mango" {
  route_table_id            = aws_route_table.vpc1_rt.id
  destination_cidr_block    = "10.90.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.mango-peering.id
}



data "aws_route_table" "mango-rt" {
  route_table_id = "rtb-0605f68249e11cf4f"
}

resource "aws_route" "mango-to-sky" {
  route_table_id            = data.aws_route_table.mango-rt.id
  destination_cidr_block    = "172.16.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.mango-peering.id
}