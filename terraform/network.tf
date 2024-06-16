# VPCを作成
resource "aws_vpc" "demo_vpc_lt_20240622" {
  cidr_block           = "10.100.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"

  tags = {
    Name = "demo-vpc"
    demo = true
  }
}

# パブリックサブネットを作成
resource "aws_subnet" "demo_public_subnet_1a_lt_20240622" {
  availability_zone = "ap-northeast-1a"
  vpc_id            = aws_vpc.demo_vpc_lt_20240622.id
  cidr_block        = "10.100.1.0/24"

  tags = {
    Name = "demo-public-subnet-1a"
    demo = true
  }
}

# インターネットゲートウェイを作成
resource "aws_internet_gateway" "demo_lt_igw" {
  vpc_id = aws_vpc.demo_vpc_lt_20240622.id
  
  tags = {
    Name = "demo-lt-igw"
    demo = true
  }
}

# ルートテーブルを作成
resource "aws_route_table" "demo_lt_public_rtb" {
  vpc_id = aws_vpc.demo_vpc_lt_20240622.id
  route {
    gateway_id = aws_internet_gateway.demo_lt_igw.id
    cidr_block = "0.0.0.0/0"
  }
  tags = {
    Name = "demo-lt-public-rtb"
    demo = true
  }
}

# ルーとテーブルとサブネットを関連付ける
resource "aws_route_table_association" "demo_lt_public_rtb_ass_a" {
  subnet_id      = aws_subnet.demo_public_subnet_1a_lt_20240622.id
  route_table_id = aws_route_table.demo_lt_public_rtb.id
}

# セキュリティグループを作成
resource "aws_security_group" "demo_lt_public_sg" {
  name   = "demo-lt-public-sg"
  vpc_id = aws_vpc.demo_vpc_lt_20240622.id

  tags = {
    Name = "demo-lt-public-sg"
    demo = true
  }
}

# インバウンド(受け入れる)ルール
resource "aws_security_group_rule" "demo_lt_public_sg_in_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.demo_lt_public_sg.id
}

# インバウンド(受け入れる)ルール
# resource "aws_security_group_rule" "demo_lt_public_sg_in_https" {
#   type              = "ingress"
#   from_port         = 443
#   to_port           = 443
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = aws_security_group.demo_lt_public_sg.id
# }