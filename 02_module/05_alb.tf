resource "aws_lb" "yslee_alb" {
  name               = "${var.name}-alb"
  internal           = false
  load_balancer_type = var.lb_type
  security_groups    = [aws_security_group.yslee_sg.id]
  subnets            = [aws_subnet.yslee_pub[0].id, aws_subnet.yslee_pub[1].id]

  tags = {
    "Name" = "${var.name}-alb"
  }
}

resource "aws_lb_target_group" "yslee_albtg" {
  name     = "${var.name}-albtg"
  port     = var.port_http
  protocol = var.protocol_http1
  vpc_id   = aws_vpc.yslee1_vpc.id

  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 5
    matcher             = "200"
    path                = "/index.html"
    port                = "traffic-port"
    protocol            = var.protocol_http1
    timeout             = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "sdkim_albli" {
  load_balancer_arn = aws_lb.yslee_alb.arn
  port              = var.port_http
  protocol          = var.protocol_http1

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.yslee_albtg.arn
  }
}

resource "aws_lb_target_group_attachment" "yslee_tgatt" {
  target_group_arn = aws_lb_target_group.yslee_albtg.arn
  target_id        = aws_instance.yslee_weba.id
  port             = var.port_http
}
