resource "aws_route_table_association" "yslee_ngass_a" {
  subnet_id = aws_subnet.yslee_pria.id
  route_table_id = aws_route_table.yslee_ngrt.id
}

resource "aws_route_table_association" "yslee_ngass_c" {
  subnet_id = aws_subnet.yslee_pric.id
  route_table_id = aws_route_table.yslee_ngrt.id
}