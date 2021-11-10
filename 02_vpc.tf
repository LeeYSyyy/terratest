resource "aws_vpc" "yslee1_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "yslee1_vpc"
  }
}