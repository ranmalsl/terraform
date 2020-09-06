resource "aws_security_group" "allow_web" {
    name = "allow web"

    ingress {
        description = "allow web traffic on port 80"
        from_port = var.my_ports["http_port"]
        to_port =  var.my_ports["http_port"]
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "allow web traffic on port 443"
        from_port = var.my_ports["https_port"]
        to_port = var.my_ports["https_port"]
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        description = "allow all"
        from_port = "0"
        to_port = "0"
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}