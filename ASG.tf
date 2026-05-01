
resource "aws_autoscaling_group" "demo_asg" {
    desired_capacity = 2
    max_size = 3
    min_size = 1
    vpc_zone_identifier = [
        aws_subnet.pri_sub1.id ,
        aws_subnet.pri_sub2.id
    ]

    launch_template {
      id = aws_launch_template.demo_TL.id
      version = "$Latest"
    }
    target_group_arns = [aws_lb_target_group.lb_target.arn]

    health_check_type = "EC2"
}