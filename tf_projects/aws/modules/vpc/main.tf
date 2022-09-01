resource "aws_vpc" "tf_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  #vpc_id = var.vpc_id

  tags = {
    Name = var.vpc_name
    Env  = "test"
  }
}

//Subnets
#Public Subnet
resource "aws_subnet" "tf_vpc_pub_sub" {
  vpc_id                  = aws_vpc.tf_vpc.id
  count                   = length(var.pub_sub_cidr)
  cidr_block              = element(var.pub_sub_cidr, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name         = "${var.vpc_name}.pub.sub-${count.index}"
    Connectivity = "public"
  }
}
#Private Subnet
resource "aws_subnet" "tf_vpc_pvt_sub" {
  vpc_id                  = aws_vpc.tf_vpc.id
  count                   = length(var.pvt_sub_cidr)
  cidr_block              = element(var.pvt_sub_cidr, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = false

  tags = {
    Name         = "${var.vpc_name}.pvt.sub-${count.index}"
    Connectivity = "private"
  }
}

//internet gateway
resource "aws_internet_gateway" "tf_vpc_ig" {
  vpc_id = aws_vpc.tf_vpc.id
  tags = {
    "Name" = "${var.vpc_name}-ig"
  }
}

//main route table
resource "aws_default_route_table" "tf_vpc_pub_rt" {
  default_route_table_id = aws_vpc.tf_vpc.default_route_table_id
  #vpc_id = aws_vpc.tf_vpc.id //no need when default rt
  tags = {
    Name = "${var.vpc_name}_pub_rt"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf_vpc_ig.id
  }
}
//alternate route entry
# resource "aws_route" "public_internet_gateway" {
#   route_table_id         = aws_default_route_table.tf_vpc_pub_rt.id
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id             = aws_internet_gateway.my_ig.id
# }

//public subnet association
resource "aws_route_table_association" "pub_rt_association" {
  count          = length(var.pub_sub_cidr)
  subnet_id      = element(aws_subnet.tf_vpc_pub_sub.*.id, count.index)
  route_table_id = aws_default_route_table.tf_vpc_pub_rt.id
}

//eip for nat gateway
# resource "aws_eip" "tf_eip" {
#   vpc = true
# }
# resource "aws_nat_gateway" "tf_nat" {
#   allocation_id = aws_eip.tf_eip.id
#   # subnet_id = aws_subnet.tf_vpc_pub_sub.id
#   subnet_id  = aws_subnet.tf_vpc_pub_sub[0].id
#   depends_on = [aws_internet_gateway.tf_vpc_ig]
#   tags = {
#     Name = "tf_vpc_nat"
#   }
# }
//secondary rt for nat
resource "aws_route_table" "tf_vpc_pvt_rt" {
  vpc_id = aws_vpc.tf_vpc.id
  tags = {
    Name = "${var.vpc_name}_pvt_rt"
  }
  # route {
  #   cidr_block     = "0.0.0.0/0"
  #   nat_gateway_id = aws_nat_gateway.tf_nat.id
  # }
}
//subnet association
resource "aws_route_table_association" "pvt_rt_association" {
  count     = length(var.pub_sub_cidr)
  subnet_id = element(aws_subnet.tf_vpc_pvt_sub.*.id, count.index)
  # subnet_id      = aws_subnet.tf_vpc_pvt_sub.id
  route_table_id = aws_route_table.tf_vpc_pvt_rt.id
}

