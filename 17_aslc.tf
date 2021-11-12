resource "aws_launch_configuration" "yslee_aslc" {
  name_prefix          = "yslee-web-"
  image_id             = aws_ami_from_instance.yslee_ami.id
  instance_type        = "t2.micro"
  iam_instance_profile = "admin_role"
  security_groups      = [aws_security_group.yslee_sg.id]
  key_name             = "yslee-key"
  #  user_data = file("./install.sh")

  lifecycle {
    create_before_destroy = true
  }
}
