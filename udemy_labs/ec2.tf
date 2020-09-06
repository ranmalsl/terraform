resource "aws_instance" "ranz_in_action" {
    ami = var.my_instance["ami"]
    instance_type = var.my_instance["type"]
    key_name = "india"
    vpc_security_group_ids = [ aws_security_group.allow_web.id ]

    user_data = <<-EOF
    #!/bin/bash
    yum -y update
    yum -y install httpd
    systemctl enable httpd && systemctl start httpd
    echo "<b>Hello World</b>" > /var/www/html/index.html
    EOF
    tags = {
        Name = "My first"
    }
}

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