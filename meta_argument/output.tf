output "vpc_ids" {
  value = aws_vpc.myapp_vpc.id[*].id  #it will give us list of IDs oa all VPCs created =>use when we use "count" as meta.
  }
