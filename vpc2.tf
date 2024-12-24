module "vpc2" {
    source = "terraform-aws-modules/vpc/aws"
    name = "yap-vpc2"
    cidr = "10.2.0.0/16"
    azs = data.aws_availability_zones.available.names
    public_subnets = ["10.2.101.0/24", "10.2.102.0/24", "10.2.103.0/24"]
    #private_subnets = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
    enable_nat_gateway = false
    single_nat_gateway = true
    enable_dns_hostnames = true
    tags = {
        Terraform = "true"
        }
}