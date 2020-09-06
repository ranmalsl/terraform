resource "aws_elb" "my_web_elb" {
    name = "terraform-elb"
    security_groups = [aws_security_group.allow_web.id]
    availability_zones = ["ap-south-1a", "ap-south-1b"]
    listener {
        lb_port = var.my_ports["http_port"]
        lb_protocol = "http"
        instance_port = var.my_ports["http_port"]
        instance_protocol = "http"
    }

    health_check {
        healthy_threshold = "2"
        unhealthy_threshold = "2"
        timeout = "3"
        interval = "30"
        target = "HTTP:80/"

    }
}