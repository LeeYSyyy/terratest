resource "aws_security_group" "yslee_sg" {
  name        = "Allow Basic"
  description = "Allow HTTP,SSH,SQL,ICMP"
  vpc_id      = aws_vpc.yslee1_vpc.id

  ingress = [
    {
      description      = var.protocol_http
      from_port        = var.port_http
      to_port          = var.port_http
      protocol         = var.protocol_tcp
      cidr_blocks      = [var.cidr_route]
      ipv6_cidr_blocks = [var.ipv6_cidr_blocks]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    {
      description      = var.protocol_ssh
      from_port        = var.port_ssh
      to_port          = var.port_ssh
      protocol         = var.protocol_tcp
      cidr_blocks      = [var.cidr_route]
      ipv6_cidr_blocks = [var.ipv6_cidr_blocks]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    {
      description      = var.db_name
      from_port        = var.port_mysql
      to_port          = var.port_mysql
      protocol         = var.protocol_tcp
      cidr_blocks      = [var.cidr_route]
      ipv6_cidr_blocks = [var.ipv6_cidr_blocks]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    {
      description      = var.protocol_icmp
      from_port        = var.port_zero
      to_port          = var.port_zero
      protocol         = var.protocol_icmp
      cidr_blocks      = [var.cidr_route]
      ipv6_cidr_blocks = [var.ipv6_cidr_blocks]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }
  ]
  egress = [
    {
      description      = "ALL"
      from_port        = var.port_zero
      to_port          = var.port_zero
      protocol         = var.protocol_minus
      cidr_blocks      = [var.cidr_route]
      ipv6_cidr_blocks = [var.ipv6_cidr_blocks]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }
  ]
  tags = {
    "Name" = "${var.name}-sg"
  }
}

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
  ami                    = "ami-04e8dfc09b22389ad"
  instance_type          = var.instance
  key_name               = var.key
  availability_zone      = "${var.region}${var.ava[0]}"
  private_ip             = var.private_ip
  subnet_id              = aws_subnet.yslee_pub[0].id #public_subnet a의 ID
  vpc_security_group_ids = [aws_security_group.yslee_sg.id]
  user_data              = file("./install1.sh")
}

resource "aws_eip" "yslee_weba_ip" {
  vpc                       = true
  instance                  = aws_instance.yslee_weba.id
  associate_with_private_ip = var.private_ip
  depends_on = [
    aws_internet_gateway.yslee_ig
  ]
}

output "public_ip" {
  value = aws_instance.yslee_weba.public_ip
}
