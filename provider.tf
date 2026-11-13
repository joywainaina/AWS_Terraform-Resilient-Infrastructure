# This is a required terraform provider block.It tells python which provider you are using, where to download it and the version of the provider

terraform{
    required_providers{
        aws = {
            source = "hashicorp/aws"   # This is the download url which in full comes to registry/terraform.io/hashicorp/aws
            version = "5.30.0"
        }
    }
}


providers "aws"{
    region = "us-east-2"
    }