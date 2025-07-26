#vpc_name = ["TEST-VPC-1", "TEST-VPC-2", "TEST-VPC-3"]
vpc_cidr =  ["10.10.0.0/16", "20.20.0.0/16", "30.30.0.0/16"]  
pub_subnet_cidr =["10.10.1.0/24", "20.20.1.0/24", "30.30.1.0/24"]
pri_subnet_cidr = ["10.10.2.0/24", "20.20.2.0/24", "30.30.2.0/24"]


#prefrance sequence eg. terraform apply -var='vpc_cidr=20.40.0.0/16'
    #command line > .tfvar file > default > manually ask
