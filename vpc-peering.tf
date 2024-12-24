# Create VPC peering connection
resource "aws_vpc_peering_connection" "peering" {
  vpc_id = module.vpc1.default_vpc_id  # Specify requester VPC
  peer_vpc_id = module.vpc2.default_vpc_id # Specify accepter VPC
  auto_accept = true  # Specify if the peering connection should be automatically accepted
}