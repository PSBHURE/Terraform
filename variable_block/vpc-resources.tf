resource "aws_vpc" "myapp_vpc" {
    cidr_block = var.vpc_cidr      #variable used => always gives 1st prefrance to .tfvars file if this vaiable is not initialize there then it uses default value of variable.tf file
    instance_tenancy = "default"    
    tags = {
        "Name" = var.vpc_name       #variable used => always gives 1st prefrance to .tfvars file if this vaiable is not initialize there then it uses default value of variable.tf file
    }
}

resource "aws_subnet" "pub_subnet" {
  vpc_id = aws_vpc.myapp_vpc.id
  cidr_block = "20.20.1.0/24"
  tags = {
    Name = "Public-Subnet"
  }
}

resource "aws_subnet" "prv_subnet" {
  vpc_id = aws_vpc.myapp_vpc.id
  cidr_block = "20.20.2.0/24"
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