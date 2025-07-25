vpc_name = "TEST-VPC"
vpc_cidr = "20.20.0.0/16"
pub_subnet_cidr = "20.20.1.0/24"
pri_subnet_cidr = "20.20.2.0/24"
pub_subnet_tags = {
    "Name" = "try-1"
    "Description" = "manual variable passes"
    "CostCenter" = "C45612"
}

#prefrance sequence eg. terraform apply -var='vpc_cidr=20.40.0.0/16'
    #command line > .tfvar file > default > manually ask
