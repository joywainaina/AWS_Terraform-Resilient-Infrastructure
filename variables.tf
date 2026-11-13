#You will not be hardcoding a value for your cidr_block; instead, you will create a variable for it.
#Terraform variables let you customize aspects of Terraform modules without altering the module's source code. 
#This functionality allows you to share modules across different Terraform configurations,
#making your modules composable and reusable.

variable "vpc_cidr"{
    default = "10.10.0.0/16"
    description = "CIDR block for our vpc"
    type = string
}


variable "pblic_subnetaz1_cidr"{
    default = "10.10.0.0/24"
    description = "cidr_block for public az1 subnet"
    type = string
}