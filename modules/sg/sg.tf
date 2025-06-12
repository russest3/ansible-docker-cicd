provider "aws" {
    region = "us-east-2"
}

locals {
    ingress = [22]
    egress = [80, 443]
}

output "sg_name" {
    value = aws_security_group.sg1.name
}

resource "aws_security_group" "sg1" {
    name = "sg1"
    dynamic "ingress" {
        iterator = port
        for_each = local.ingress
        content {
            from_port = port.value
            to_port = port. value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
    dynamic "egress" {
        iterator = port
        for_each = local.egress
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}