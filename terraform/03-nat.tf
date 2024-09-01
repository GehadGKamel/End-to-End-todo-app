resource "aws_eip" "my_nat_eip" {
  
  tags = {
    Name = "My NAT EIP"
  }

}

resource "aws_nat_gateway" "my_vpc_nat" {
  allocation_id = aws_eip.my_nat_eip.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "gw NAT"
  }

  depends_on = [aws_internet_gateway.my_vpc_igw]
}
