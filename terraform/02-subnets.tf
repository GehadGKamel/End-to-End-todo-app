resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.10.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Public Subnet"
  }
}

resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.10.2.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Private_1 Subnet"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.10.3.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "Private_2 Subnet"
  }
}
