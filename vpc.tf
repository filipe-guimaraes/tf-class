#Configuration for VPC
resource "aws_vpc" "hackone" {
  cidr_block       = "10.10.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Hackone"
  }
}

resource "aws_internet_gateway" "hackone" {
  vpc_id = aws_vpc.hackone.id

  tags = {
    Name = "Hackone IGW"
  }
}

#------ Public Subnets --------------
resource "aws_subnet" "public_subnet_01" {
  vpc_id                  = aws_vpc.hackone.id
  cidr_block              = "10.10.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public_subnet_02" {
  vpc_id                  = aws_vpc.hackone.id
  cidr_block              = "10.10.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
}

#------ Private Subnets --------------
resource "aws_subnet" "private_subnet_01" {
  vpc_id            = aws_vpc.hackone.id
  cidr_block        = "10.10.10.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_subnet" "private_subnet_02" {
  vpc_id            = aws_vpc.hackone.id
  cidr_block        = "10.10.11.0/24"
  availability_zone = "us-east-1b"
}


#---- Route Table Configuration ------------
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.hackone.id

  route {
    cidr_block = var.default_cidr_block
    gateway_id = aws_internet_gateway.hackone.id
  }

  tags = {
    Name = "Public RT"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.hackone.id

  tags = {
    Name = "Private RT"
  }
}

resource "aws_route_table_association" "public-01" {
  subnet_id      = aws_subnet.public_subnet_01.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public-02" {
  subnet_id      = aws_subnet.public_subnet_02.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private-01" {
  subnet_id      = aws_subnet.private_subnet_01.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private-02" {
  subnet_id      = aws_subnet.private_subnet_02.id
  route_table_id = aws_route_table.private_rt.id
}