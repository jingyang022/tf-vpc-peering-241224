# Declare the data source
data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc1" {
    source = "terraform-aws-modules/vpc/aws"
    name = "yap-vpc1"
    cidr = "10.1.0.0/16"
    azs = data.aws_availability_zones.available.names
    public_subnets = ["10.1.101.0/24", "10.1.102.0/24", "10.1.103.0/24"]
    #public_subnet_tags = ["vpc1-PublicSubnet-1a", "vpc1-PublicSubnet-1b", "vpc1-PublicSubnet-1c"]
    #private_subnets = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
    enable_nat_gateway = false
    single_nat_gateway = true
    enable_dns_hostnames = true
    tags = {
        Terraform = "true"
        }
}