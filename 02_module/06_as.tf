resource "aws_ami_from_instance" "yslee_ami" {
  name               = "${var.name}-aws-ami"
  source_instance_id = aws_instance.yslee_weba.id

  depends_on = [
    aws_instance.yslee_weba
  ]

  tags = {
    "Name" = "${var.name}-ami"
  }
}

resource "aws_launch_configuration" "yslee_aslc" {
  name_prefix          = "${var.name}-web-"
  image_id             = aws_ami_from_instance.yslee_ami.id
  instance_type        = var.instance
  iam_instance_profile = "admin_role"
  security_groups      = [aws_security_group.yslee_sg.id]
  key_name             = var.key
  #  user_data = file("./install.sh")

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_placement_group" "yslee_place" {
  name     = "${var.name}-place"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "yslee_asg" {
  name                      = "${var.name}-asg"
  min_size                  = 2
  max_size                  = 10
  health_check_grace_period = 10
  health_check_type         = "EC2"
  desired_capacity          = 2
  force_delete              = true
  launch_configuration      = aws_launch_configuration.yslee_aslc.name
  vpc_zone_identifier       = [aws_subnet.yslee_pub[0].id, aws_subnet.yslee_pub[1].id]

}

resource "aws_autoscaling_attachment" "yslee_asgalbatt" {
  autoscaling_group_name = aws_autoscaling_group.yslee_asg.id
  alb_target_group_arn   = aws_lb_target_group.yslee_albtg.arn

}
