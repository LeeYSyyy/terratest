# 가용영역 a의 public subnet
resource "aws_subnet" "yslee_puba" {
  vpc_id = aws_vpc.yslee1_vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "yslee-puba"
  }
}
# 가용영역 a의 private subnet
resource "aws_subnet" "yslee_pria" {
  vpc_id = aws_vpc.yslee1_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "ap-northeast-2a"
  tags = {
    "Name" = "yslee-pria"
  }
}
# 가용영역 c의 public subnet
resource "aws_subnet" "yslee_pubc" {
  vpc_id = aws_vpc.yslee1_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "yslee-pubc"
  }
}
# 가용영역 c의 private subnet
resource "aws_subnet" "yslee_pric" {
  vpc_id = aws_vpc.yslee1_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "ap-northeast-2c"
  tags = {
    "Name" = "yslee-pric"
  }
}