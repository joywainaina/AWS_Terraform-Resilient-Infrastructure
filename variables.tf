#You will not be hardcoding a value for your cidr_block; instead, you will create a variable for it.
#Terraform variables let you customize aspects of Terraform modules without altering the module's source code. 
#This functionality allows you to share modules across different Terraform configurations,
#making your modules composable and reusable.

variable "vpc_cidr"{
    default = "10.10.0.0/16"
    description = "CIDR block for our vpc"
    type = string
}


variable "public_subnetaz1_cidr"{
    default = "10.10.0.0/24"
    description = "cidr_block for public az1 subnet"
    type = string
}


variable "private_app_subnet_az1_cidr"{
    default = 10.0.2.0/24
    description = "cidr block for private subnet1"
    type = string
}


variable "private_app_subnet_az2_cidr"{
    default = 10.0.3.0/24
    description = "cidr block for private subnet2"
    type = string
}


variable "private_data_subnet_az1_cidr"{
    default = "10.0.4.0/24"
    description = "cidr block for private data subnet1"
    type = string
}


variable "private_data_subnet_az2_cidr"{
    default = 10.0.5.0/24
    description = "cidr block for private data subnet2"
    type = string
}