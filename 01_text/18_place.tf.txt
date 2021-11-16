resource "aws_placement_group" "yslee_place" {
  name = "yslee-place"
  strategy = "cluster"
}