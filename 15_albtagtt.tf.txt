resource "aws_lb_target_group_attachment" "yslee_tgatt" {
  target_group_arn = aws_lb_target_group.yslee_albtg.arn
  target_id        = aws_instance.yslee_weba.id
  port             = 80
}
