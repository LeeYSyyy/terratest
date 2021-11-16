resource "aws_route_table" "yslee_rt" {
  vpc_id = aws_vpc.yslee1_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.yslee_ig.id
  }
  tags = {
    "Name" = "yslee_rt"
  }
}