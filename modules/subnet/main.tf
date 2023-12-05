terraform {
  cloud {
    organization = "024_2023-summer-cloud-t"

    workspaces {
      name = "infra-subnet"
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

# data "aws_vpc" "selected" {
#   id = var.vpc_id
# }

resource "aws_subnet" "main" {
  for_each = var.subnets

  vpc_id     = var.vpc_id           #data.aws_vpc.selected.id
  cidr_block = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = {
    Name = each.key
  }
}

output "subnet_name" {
    value = var.subnets
}
