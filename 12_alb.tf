resource "aws_lb" "yslee_alb" {
  name = "yslee-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.yslee_sg.id]
  subnets = [aws_subnet.yslee_puba.id,aws_subnet.yslee_pubc.id]

  tags = {
    "Name" = "yslee-alb"
  }
  }