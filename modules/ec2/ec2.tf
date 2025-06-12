locals {
    ec2name = "vm1"
}

resource "aws_instance" "ec2" {
    ami = "ami-06971c49acd687c30"
    instance_type = "t2.micro"
    key_name = "deployer-key"
    security_groups = [ "sg1" ]
    tags = {
        Name = local.ec2name
    }
}

output "instance_id" {
    value = aws_instance.ec2.id
}

output "public_ip" {
    value = aws_instance.ec2.public_ip
}