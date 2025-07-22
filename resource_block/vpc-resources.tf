resource "aws_vpc" "myapp_vpc" {
    cidr_block = "10.20.0.0/16"
    instance_tenancy = "default"
    tags = {
        "Name" = "BIN-APP-VPC"
    }
}

resource "aws_subnet" "pub_subnet" {
  vpc_id = aws_vpc.myapp_vpc.id
  cidr_block = "10.20.1.0/24"
  tags = {
    Name = "Public-Subnet"
  }
}

resource "aws_subnet" "prv_subnet" {
  vpc_id = aws_vpc.myapp_vpc.id
  cidr_block = "10.20.2.0/24"
  tags = {
    Name = "Private-Subnet"
  }
}

resource "aws_internet_gateway" "binapp_vpc_igw" {
  tags = {
    "Name" = "BINAPP-IGW"
  }
}

resource "aws_internet_gateway_attachment" "name" {
  vpc_id = aws_vpc.myapp_vpc.id
  internet_gateway_id = aws_internet_gateway.binapp_vpc_igw.id
}

resource "aws_route_table" "prv_subnet_rout_table" {
  vpc_id = aws_vpc.myapp_vpc.id

  route {
    gateway_id = aws_internet_gateway.binapp_vpc_igw.id
    cidr_block = "0.0.0.0/0"
  }
  
  tags = {
    "Name" = "Private-RT"
  }
}