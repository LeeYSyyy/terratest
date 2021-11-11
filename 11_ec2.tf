/*
data "aws_ami" "amzn" {
  most_recent =

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name = "virtualization-type"
    valus = ["hvm"]
  }

  owners = ["amazon"]
}
*/

resource "aws_instance" "yslee_weba" {
  ami = "ami-04e8dfc09b22389ad"
  instance_type = "t2.micro"
  key_name = "yslee-key"
  availability_zone = "ap-northeast-2a"
  private_ip = "10.0.0.11"
  subnet_id = aws_subnet.yslee_puba.id  #public_subnet a의 ID
  vpc_security_group_ids = [aws_security_group.yslee_sg.id]
  user_data = <<-EOF
                #!/bin/bash
                sudo su -
                yum install -y httpd
                echo "YSLEE-Terraform-1" >> /var/www/html/index.html
                systemctl start httpd
                EOF
}

resource "aws_eip" "yslee_weba_ip" {
  vpc = true
  instance = aws_instance.yslee_weba.id
  associate_with_private_ip = "10.0.0.11"
  depends_on = [
    aws_internet_gateway.yslee_ig
  ]
}