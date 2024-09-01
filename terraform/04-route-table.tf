resource "aws_route_table" "private" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.my_vpc_nat.id
  }
  tags = {
    Name = "Private Subnet Route Table."
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_vpc_igw.id
  }
  tags = {
    Name = "Public Subnet Route Table."
  }

}

resource "aws_route_table_association" "private-us-east-1a" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private.id

}

resource "aws_route_table_association" "private-us-east-1b" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private.id

}

resource "aws_route_table_association" "public-us-east-1a" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
