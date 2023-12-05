# terraform {
#   cloud {
#     organization = "024_2023-summer-cloud-t"

#     workspaces {
#       name = "infra-vpc"
#     }
#   }

#    required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 5.0"
#     }
#   }
# }

# # Configure the AWS Provider
# provider "aws" {
#   region = "us-east-1"
# }


resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr  #"10.0.0.0/16"
    
  tags = {
    Name = var.tags
  }
}

variable "tags" {
    type = string
}

variable "vpc_cidr" {
  type = string
}

output "vpc_id" {
  value = aws_vpc.main.id
} 