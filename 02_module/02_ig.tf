resource "aws_internet_gateway" "yslee_ig" {
  vpc_id = aws_vpc.yslee1_vpc.id

  tags = {
    Name = "${var.name}_ig"
  }
}

resource "aws_route_table" "yslee_rt" {
  vpc_id = aws_vpc.yslee1_vpc.id

  route {
    cidr_block = var.cidr_route
    gateway_id = aws_internet_gateway.yslee_ig.id
  }
  tags = {
    "Name" = "${var.name}_rt"
  }
}

resource "aws_route_table_association" "yslee_rtas_a" {
  count = length(var.cidr_public)
  subnet_id      = aws_subnet.yslee_pub[count.index].id
  route_table_id = aws_route_table.yslee_rt.id
}

