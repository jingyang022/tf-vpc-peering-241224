# Update route tables
/* resource "aws_route_table" "route_table_vpc1" {
  vpc_id = module.vpc1.vpc_id
}

resource "aws_route_table" "route_table_vpc2" {
  vpc_id = module.vpc2.vpc_id
} */

resource "aws_route" "route_to_vpc2" {
  route_table_id            = module.vpc1.public_route_table_ids[0]
  destination_cidr_block    = module.vpc2.vpc_cidr_block  # CIDR block of VPC2
  vpc_peering_connection_id = aws_vpc_peering_connection.peering.id  # Specify peering connection ID
}

resource "aws_route" "route_to_vpc1" {
  route_table_id            = module.vpc2.public_route_table_ids[0]  # Specify route table ID of VPC2
  destination_cidr_block    = module.vpc1.vpc_cidr_block  # CIDR block of VPC1
  vpc_peering_connection_id = aws_vpc_peering_connection.peering.id  # Specify peering connection ID
}