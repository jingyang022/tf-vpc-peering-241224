resource "aws_instance" "web-app1" {
    ami = "ami-04c913012f8977029"
    instance_type = "t2.micro"
    subnet_id = module.vpc1.public_subnets[0]
    associate_public_ip_address = true
    #iam_instance_profile = aws_iam_instance_profile.ec2_profile.name
    #key_name = "yap-231124" #Change to your keyname, e.g. jazeel-key-pair
    vpc_security_group_ids = [aws_security_group.yap-vpc1-sg.id]

    tags = {
        Name = "yap-vpc1-server"
        }
}

resource "aws_security_group" "yap-vpc1-sg" {
    name = "yap-vpc1-sg" #Security group name
    description = "Security group for ec2 server1"
    vpc_id = module.vpc1.vpc_id #VPC ID (Same VPC as your EC2 subnet above), E.g. vpc-xxxxxxx
    
    lifecycle {
      create_before_destroy = true
    }

    tags = {
        Name = "yap-vpc1-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
    security_group_id = aws_security_group.yap-vpc1-sg.id
    cidr_ipv4 = "0.0.0.0/0"
    from_port = 22
    ip_protocol = "tcp"
    to_port = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_traffic_from_vpc2" {
    security_group_id = aws_security_group.yap-vpc1-sg.id
    cidr_ipv4 = "10.2.0.0/16"
    from_port = 80
    ip_protocol = "tcp"
    to_port = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.yap-vpc1-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}