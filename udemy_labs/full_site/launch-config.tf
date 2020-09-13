resource "aws_launch_configuration" "my-launch-config" {
    #name = "webserver-launch"
    image_id = var.my_instance["ami"]
    instance_type = var.my_instance["type"]
    security_groups = [aws_security_group.allow_web.id]
    key_name = "india"
    iam_instance_profile = "SSMInstanceProfile"

    user_data = <<-EOF
    #!/bin/bash
    yum -y update
    yum -y install httpd
    systemctl enable httpd && systemctl start httpd
    echo "<b>Hello World</b>" > /var/www/html/index.html
    curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/ami-id >> /var/www/html/index.html
    EOF
    
    lifecycle {
        create_before_destroy = true
    }
}