output "vpc1_id" {
  value = module.vpc1.vpc_id
}

output "vpc2_id" {
  value = module.vpc2.vpc_id
}

output "vpc1_CIDR" {
  value = module.vpc1.vpc_cidr_block
}

/* output "vpc1_route_table"{
  value = aws_route_table.route_table_vpc1.id
} */

output "public_subnet1_id" {
  value = module.vpc1.public_subnets[0]
}

output "vpc1_public_route_table1_id" {
  value = module.vpc1.public_route_table_ids[0]
}