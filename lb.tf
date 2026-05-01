resource "aws_lb" "demo_lb" {
    internal = false
    load_balancer_type = "application"

    security_groups = [
        aws_security_group.alb_sg.id
    ]

    subnets = [
        aws_subnet.sub1.id,
        aws_subnet.sub2.id
    ]
}

resource "aws_lb_target_group" "lb_target" {
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.main_vpc.id
    health_check {
      path = "/"
      port = "traffic-port"
    }
}
resource "aws_lb_listener" "lb_listioner" {
    load_balancer_arn = aws_lb.demo_lb.arn
    port = 80
    protocol = "HTTP"
    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.lb_target.arn
    }
}