region = "us-east-1"
cidr_blocks = "10.60.0.0/16"
security_ports_ingress = [8080, 80, 9090, 443, 3306, 22]
security_ports_egress = "0.0.0.0/0"
public_subnet_avz = "us-east-1a"
public_subnet_name = "venu_pub_sub"
private_subnet_avz = "us-east-1b"
private_subnet_name = "venu_private_sub"
public_subnet_cidr = "10.60.1.0/24"
private_subnet_cidr = "10.60.2.0/24"
author = "venugopal"
when = "2025-06-06"
route_cidr = "0.0.0.0/0"
route_table_name = "venu_public_route"
security_group = "venu_security_group"
vpc_name = "venu_vpc"
internet_gateway = "venu_public_IGW"



