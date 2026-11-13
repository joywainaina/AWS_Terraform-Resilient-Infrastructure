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