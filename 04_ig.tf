# 10.0.0.0/16 VPC 전용 Internet Gateway
resource "aws_internet_gateway" "yslee_ig" {
  vpc_id = aws_vpc.yslee1_vpc.id

  tags = {
    Name = "yslee_ig"
  }
}