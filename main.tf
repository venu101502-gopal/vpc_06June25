provider "aws" {
  region = var.region
  
}

resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  instance_tenancy = "default"
  enable_dns_hostnames = true
  assign_generated_ipv6_cidr_block = true
  

  tags = {
    Name = var.vpc_name
    author = var.author
    when = var.when
  }
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.internet_gateway
    author = var.author
    when = var.when
  }
  
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone = var.public_subnet_avz
  assign_ipv6_address_on_creation = true

  tags = {
    Name = var.public_subnet_name
    author = var.author
    when = var.when
  }
  
}


resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.private_subnet_cidr
  map_public_ip_on_launch = false
  availability_zone = var.private_subnet_avz
  
  tags = {
    Name = var.private_subnet_name
    author = var.author
    when = var.when
  }
}


resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.vpc.id
  

  route {
    cidr_block = var.route_cidr
    gateway_id = aws_internet_gateway.IGW.id
  }

  tags = {
    Name = var.route_table_name
    author = var.author
    when = var.when
  }
  
}

resource "aws_route_table_association" "venu_public_route_table_assoc" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public_route.id    

  
}


resource "aws_security_group" "public_security" {
  name        = var.security_group
  vpc_id      = aws_vpc.vpc.id

  dynamic "ingress" {
    for_each = var.security_ports_ingress
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = var.cidr_blocks  # Use var.cidr_blocks for ingress
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.security_ports_egress
  }

  tags = {
    Name   = var.security_group
    author = var.author
    when   = var.when
  }
}
  
  
}
