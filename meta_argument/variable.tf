variable "vpc_name" {
  type = list(string)
  default = ["DEV-APP-VPC-1", "DEV-APP-VPC-2", "DEV-APP-VPC-3"]    #if this default vlue not provided and there is no initialization of variable in .tfvar file then it will ask you input at time of "terraform plan"
}

variable "vpc_cidr" {
  type = list(string)
  default = ["10.10.0.0/16", "20.20.0.0/16", "30.30.0.0/16"]   #if this default vlue not provided and there is no initialization of variable in .tfvar file then it will ask you input at time of "terraform plan"
}

variable "pub_subnet_cidr" {
  type = list(string)
  default = ["10.10.1.0/24", "20.20.1.0/24", "30.30.1.0/24"]
}

variable "pri_subnet_cidr" {
  type = list(string)
  default = ["10.10.2.0/24", "20.20.2.0/24", "30.30.2.0/24"]
}

variable "pub_subnet_tags" {
  default = [
    { Name = "Public-Subnet-0" },
    { Name = "Public-Subnet-1" },
    { Name = "Public-Subnet-2" }
  ]
}

variable "env_type" {
  type = list(string)
  default = [ "DEMO", "DEV", "QC" ]
}

variable "app_type"{
  type = list(string)
  default = [ "WEB", "MOBILE", "DB" ]
}

