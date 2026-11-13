resource "aws_vpc" "main_vpc"{
    cidr_block = var.vpc_cidr 
    instance_tenancy = "default"   # There's a default(shared hardware) tenancy and a dedicated tenancy for instances.
    enable_dns_hostnames = true # This will get public dns hostnames assigned

    tags = {
        Name = "joy vpc"
    }
}


resource "aws_internet_gateway" "internet_gateway" {
    vpc_id = aws_vpc.main_vpc.id

# tags are useful for identifying and organizing your resources
    tags = {
        name = "joy internet_gateway"
    }
}


resource "aws_subnet" "public_subnet_az1"{
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = var.public_subnetaz1_cidr
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true

    tags = {
        name = "joy public_subnet_az1"
        availability_zone = 

    
    }
}


# Public subnet for az2
resource "aws_public_subnet" "public_subnet_az2"{
    vpc_id = aws_vpc.main_vpc.id

    cidr_block = var.public_subnetaz2_cidr
    availability_zone = "us_east_1b"
}


# Creating a route table
resource "aws_route_table" "main_route_table"{
    vpc_id = aws_vpc.main_vpc.id

    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet_gateway.id
    }

    tags = {
        name = "joy_main_route_table"
    }
}


# Associating the public_subnet_az1 with the main route table
resource "aws_route_table_association" "public_subnet_az1_route_table_association"{
    subnet_id = aws_subnet.public_subnet_az1.id
    route_table_id = aws_route_table.main_route_table.id
}


#Associating the public_subnet_az2 with the main route table
resource "aws_route_table_association" "public_subnet_az2_route_table_association"{
    subnet_id = aws_subnet.public_subnet_az2.id
    route_table_id = aws_route_table.main_route_table.id
}


# Creating a private appsubnet in az1
resource "aws_private_subnet" "private_app_subnet_az1_cidr"{
    vpc_id = aws_vpc.main_vpc.id

    cidr_block = var.private_subnetaz1_cidr
    availability_zone = "us_east_1a"

    tags = {
        name = "joy_private_subnet1b"
    }
}

# creating a private subnet in az2
resource "aws_private_subnet" "private_app_subnet_az2"{
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = var.private_subnetaz2_cidr
    availability_zone - "us_east_1b"
    map_public_ip_on_launch = false

    tags = {
        name = "joy_private_subnet1b"
    }
}