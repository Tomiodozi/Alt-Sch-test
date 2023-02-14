#  Create a new load balancer
resource "aws_lb" "app" {
  name               = "applb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg.id]
  subnets            = [aws_subnet.sub1.id, aws_subnet.sub2.id, aws_subnet.sub3.id]
}
resource "aws_lb_target_group" "tg" {
  name     = "web-front"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.mainvpc.id
  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 10
    matcher             = 200
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 3
    unhealthy_threshold = 2
  }
}
resource "aws_lb_listener" "elb" {
  load_balancer_arn = aws_lb.app.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}
resource "aws_lb_target_group_attachment" "aa" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.achillies-linux.id
  port             = 80
}
resource "aws_lb_target_group_attachment" "aa2" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.achillies-linux2.id
  port             = 80
}
resource "aws_lb_target_group_attachment" "aa3" {
  target_group_arn = aws_lb_target_group.tg.arn
  target_id        = aws_instance.achillies-linux3.id
  port             = 80
}