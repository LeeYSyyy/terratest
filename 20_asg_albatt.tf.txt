resource "aws_autoscaling_attachment" "yslee_asgalbatt" {
  autoscaling_group_name = aws_autoscaling_group.yslee_asg.id
  alb_target_group_arn   = aws_lb_target_group.yslee_albtg.arn

}
