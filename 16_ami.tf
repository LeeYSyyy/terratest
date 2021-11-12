resource "aws_ami_from_instance" "yslee_ami" {
  name               = "yslee-aws-ami"
  source_instance_id = aws_instance.yslee_weba.id

  depends_on = [
    aws_instance.yslee_weba
  ]

  tags = {
    "Name" = "yslee-ami"
  }
}
