resource "aws_eip" "yslee_eip_ng" {
  vpc = true
}

resource "aws_nat_gateway" "yslee_ng" {
  allocation_id = aws_eip.yslee_eip_ng.id
  subnet_id     = aws_subnet.yslee_pub[0].id
  tags = {
    "Name" = "${var.name}-ng"
  }
  depends_on = [
    aws_internet_gateway.yslee_ig
  ]
}

resource "aws_route_table" "yslee_ngrt" {
  vpc_id = aws_vpc.yslee1_vpc.id

  route {
    cidr_block = var.cidr_route
    gateway_id = aws_nat_gateway.yslee_ng.id
  }
  tags = {
    "Name" = "${var.name}-ngrt"
  }
}

resource "aws_route_table_association" "yslee_ngass_a" {
  count          = length(var.cidr_private)
  subnet_id      = aws_subnet.yslee_pri[count.index].id
  route_table_id = aws_route_table.yslee_ngrt.id
}
