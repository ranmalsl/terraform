resource "aws_autoscaling_group" "web_asg" {
    launch_configuration = aws_launch_configuration.my-launch-config.name
    load_balancers = [aws_elb.my_web_elb.name]
    availability_zones = ["ap-south-1a", "ap-south-1b"]
    min_size = 2
    max_size = 5
    desired_capacity = 3

    tag {
        key = "Name"
        value = "terraform-asg"
        propagate_at_launch = true
    }

}