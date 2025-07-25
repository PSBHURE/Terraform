resource "aws_vpc" "myapp_vpc" {
    provider = aws.south-1              # using "provider" meta with alias so my resource will create in perticular region where i want
    count = 3                                          #using "count" meta argument
    cidr_block = var.vpc_cidr_range[count.index]      # modifies as per count meta argument 
    instance_tenancy = "default"    
    tags = {
        "Name" = "VPC-${count.index}"    
    }
}

resource "aws_subnet" "pub_subnet" {
  depends_on = [ aws_vpc.myapp_vpc ]        #using depends on meata arguement
  vpc_id = aws_vpc.myapp_vpc.id
  cidr_block = var.pub_subnet_cidr
  tags = var.pub_subnet_tags
}

resource "aws_subnet" "prv_subnet" {
  depends_on = [ aws_vpc.myapp_vpc ]      #using depends on meata arguement
  vpc_id = aws_vpc.myapp_vpc.id
  cidr_block = var.pri_subnet_cidr
  tags = {
    "Name" = "Private-Subnet"
  }
}

resource "aws_internet_gateway" "binapp_vpc_igw" {
  depends_on = [ aws_vpc.myapp_vpc, aws_subnet.prv_subnet, aws_subnet.pub_subnet ]      #using depends on meata arguement
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