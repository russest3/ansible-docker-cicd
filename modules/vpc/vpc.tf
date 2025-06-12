provider "aws" {
    region = "us-east-2"
}

data "aws_availability_zones" "available" {}

locals {
  vpcname   = "vpc1"
  region = "us-east-2"
  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)
  ec2name = "vm1"

#   tags = {
#     Example    = local.name
#     GithubRepo = "terraform-aws-vpc"
#     GithubOrg  = "terraform-aws-modules"
#   }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.21.0"
  name = local.vpcname
  cidr = local.vpc_cidr
  azs  = local.azs
  private_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 4, k)] 
}

# output "vpc_id" {
#     value = vpc.id
# }