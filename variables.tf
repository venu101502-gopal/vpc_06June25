variable "region" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "internet_gateway" {
  type = string
}

variable "public_subnet_name" {
  type = string
}

variable "private_subnet_name" {
  type = string
}

variable "cidr_block" {
  type = string
}

variable "security_ports" {
  type = list(number)  # Changed to list(number) if it's meant to be a list of ports
}

variable "security_ports_egress" {
  type = list(string)  
}

variable "security_ports_egress" {
  type = string  # Keep as string if it's a CIDR block or a specific value
}

variable "public_subnet_avz" {
  type = string
}

variable "private_subnet_avz" {
  type = string
}

variable "public_subnet_cidr" {
  type = string
}

variable "private_subnet_cidr" {
  type = string
}

variable "author" {
  type = string
}

variable "when" {
  type = string
}

variable "route_cidr" {
  type = string
}

variable "route_table_name" {
  type = string
}

variable "security_group" {
  type = string
}

variable "cidr_blocks" {
  type = string
}
