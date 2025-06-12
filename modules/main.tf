provider "aws" {
    region = "us-east-2"
}

module "ec2module" {
    source = "./ec2"
}

module "vpcmodule" {
    source = "./vpc"
}

module "key_pairmodule" {
    source = "./key_pair"
}

module "sgmodule" {
    source = "./sg"
}

output "module_output" {
    value = module.ec2module.instance_id
}

output "sg_output" {
    value = module.sgmodule.sg_name
}

output "public_ip_output" {
    value = module.ec2module.public_ip
}

# output "vpc_output" {
#     value = module.vpcmodule.vpc_id
# }
