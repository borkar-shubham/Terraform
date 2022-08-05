resource "aws_vpc" "tf_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "tf_vpc"
    Env  = "test"
  }
}

//Subnets
resource "aws_internet_gateway" "my_ig" {
  vpc_id = aws_vpc.tf_vpc.id
}
#Public Subnet
resource "aws_subnet" "tf_vpc_pub_sub" {
  vpc_id                  = aws_vpc.tf_vpc.id
  cidr_block              = var.pub_sub_cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  #gateway_id = aws_internet_gateway.my_ig.id

  tags = {
    Name         = "tf_vpc.pub.sub"
    Connectivity = "public"
  }
}
#Private Subnet
resource "aws_subnet" "tf_vpc_pvt" {
  vpc_id                  = aws_vpc.tf_vpc.id
  cidr_block              = var.pvt_sub_cidr
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name         = "tf_vpc.pvt.sub"
    Connectivity = "private"
  }
}
#Route Table
resource "aws_route_table" "tf_vpc_rt" {
  vpc_id = aws_vpc.tf_vpc.id
  tags = {
    Name = "tf_vpc_rt"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_ig.id
  }
}
//alternate route entry
# resource "aws_route" "public_internet_gateway" {
#   route_table_id         = aws_default_route_table.tf_vpc_rt.id
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id             = aws_internet_gateway.my_ig.id
# }
resource "aws_route_table_association" "tf_vpc_rt" {
  subnet_id      = aws_subnet.tf_vpc_pub_sub.id
  route_table_id = aws_route_table.tf_vpc_rt.id
}

resource "aws_eip" "tf_eip" {
  vpc = true
}
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.server-1.id
  allocation_id = aws_eip.tf_eip.id
}