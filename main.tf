terraform {
  cloud {
    organization = "024_2023-summer-cloud-t"

    workspaces {
      name = "infra-vpc"
    }
  }

   required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}


# resource "aws_vpc" "main" {
#   cidr_block       = var.vpc_cidr  #"10.0.0.0/16"
    
#   tags = {
#     Name = "Main"
#   }
# }

# output "vpc_id" {
#   value = aws_vpc.main.id
# } 

module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  tags = "AppleVPC"
}

module "subnets" {
  source = "./modules/subnet"
  vpc_id = module.vpc.vpc_id
  subnets = {
    my_subnet_1 = {
        cidr_block = "10.0.1.0/24"
        availability_zone = "us-east-1a"
    }
    my_subnet_2 = {
        cidr_block = "10.0.2.0/24"
        availability_zone = "us-east-1b"
    }
    my_subnet_3 = {
        cidr_block = "10.0.3.0/24"
        availability_zone = "us-east-1c"
    }
  }

}






# module "vpc_remote" {
#   source  = "terraform-aws-modules/vpc/aws"

#   name = "my_vpc_from_remote_module"
#   cidr = "10.0.0.0/16"
    
# }

