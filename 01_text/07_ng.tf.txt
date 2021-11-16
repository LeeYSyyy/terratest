resource "aws_eip" "yslee_eip_ng" {
  vpc = true
}

resource "aws_nat_gateway" "yslee_ng" {
  allocation_id = aws_eip.yslee_eip_ng.id
  subnet_id = aws_subnet.yslee_puba.id
  tags = {
    "Name" = "yslee-ng"
  }
  depends_on = [
    aws_internet_gateway.yslee_ig
  ]
}