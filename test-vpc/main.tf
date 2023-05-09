provider "aws" {
  region = "us-west-2"  # Replace with your desired region
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"  # Replace with your desired CIDR block

  tags = {
    Name = "my-vpc"  # Replace with your desired VPC name
  }
}

resource "aws_subnet" "my_subnet" {
  count = 2  # Replace with the number of subnets you want to create

  cidr_block = "10.0.${count.index + 1}.0/24"  # Replace with your desired CIDR block for each subnet
  vpc_id     = aws_vpc.my_vpc.id

  tags = {
    Name = "pub-subnet-${count.index + 1}"  # Replace with your desired subnet name
  }
}

resource "aws_subnet" "my_subnet_3" {
  cidr_block = "10.0.3.0/24"
  vpc_id     = aws_vpc.my_vpc.id

  tags = {
    Name = "priv-subnet-3"
  }
}

resource "aws_subnet" "my_subnet_4" {
  cidr_block = "10.0.4.0/24"
  vpc_id     = aws_vpc.my_vpc.id

  tags = {
    Name = "priv-subnet-4"
  }
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my-igw"  # Replace with your desired Internet Gateway name
  }
}

resource "aws_route_table" "my_rt" {    #public route table
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "pub-rt"  # Replace with your desired Route Table name
  }
}

resource "aws_route_table" "priv_rt" {    #private route table
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "priv-rt"  # Replace with your desired Route Table name
  }
}

resource "aws_route" "my_route" {
  route_table_id = aws_route_table.my_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.my_igw.id
}

resource "aws_route_table_association" "my_rta" {
  count = 2  # Replace with the number of subnets you want to associate with the Route Table

  subnet_id      = aws_subnet.my_subnet[count.index].id
  route_table_id = aws_route_table.my_rt.id
}

resource "aws_route_table_association" "my_rta_3" {
  subnet_id      = aws_subnet.my_subnet_3.id
  route_table_id = aws_route_table.priv_rt.id
}

resource "aws_route_table_association" "my_rta_4" {
  subnet_id      = aws_subnet.my_subnet_4.id
  route_table_id = aws_route_table.priv_rt.id
}

