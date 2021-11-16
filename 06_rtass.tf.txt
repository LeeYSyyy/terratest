resource "aws_route_table_association" "yslee_rtas_a" {
  subnet_id      = aws_subnet.yslee_puba.id
  route_table_id = aws_route_table.yslee_rt.id
}

resource "aws_route_table_association" "yslee_rtas_c" {
  subnet_id      = aws_subnet.yslee_pubc.id
  route_table_id = aws_route_table.yslee_rt.id
}
