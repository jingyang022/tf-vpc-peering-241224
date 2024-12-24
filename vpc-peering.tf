# Create VPC peering connection
resource "aws_vpc_peering_connection" "peering" {
  vpc_id = module.vpc1.vpc_id  # Specify requester VPC
  peer_vpc_id = module.vpc2.vpc_id # Specify accepter VPC
  auto_accept = true  # Specify if the peering connection should be automatically accepted

  tags = {
    Name = "yap-vpc-peering"
  }
}