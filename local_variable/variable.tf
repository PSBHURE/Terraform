variable "vpc_name" {
  type = string
  default = "DEV-APP-VPC"    #if this default vlue not provided and there is no initialization of variable in .tfvar file then it will ask you input at time of "terraform plan"
}

variable "vpc_cidr" {
  type = string
  default = "10.20.0.0/16"   #if this default vlue not provided and there is no initialization of variable in .tfvar file then it will ask you input at time of "terraform plan"
}

variable "pub_subnet_cidr" {
  type = string
  default = "10.20.1.0/24"
}

variable "pri_subnet_cidr" {
  type = string
  default = "10.20.2.0/24"
}

variable "pub_subnet_tags" {
  type = map(string)
  default = {
    "Name"        = "Public-Subnet"
    "Description" = "XYZ"
    "CostCenter"  = "C123455"
  }
}

variable "env_type" {
  type = list(string)
  default = [ "DEMO", "DEV", "QC", "SIT", "UAT", "PROD" ]
}

variable "app_type"{
  type = list(string)
  default = [ "WEB", "MOBILE", "DB" ]
}