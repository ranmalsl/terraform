resource "aws_route53_record" "www" {
    zone_id = var.my_zone_id
    name = var.my_domain
    type = "CNAME"
    ttl = "60"
    records = [aws_elb.my_web_elb.dns_name]
}