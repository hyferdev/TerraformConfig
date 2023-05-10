resource "aws_instance" "Red1" {
  ami           = "ami-0dda7e535b65b6469"  # Redhat
  instance_type = "t2.micro"  # Replace with your desired instance type

  subnet_id = aws_subnet.my_subnet[0].id  # Replace with the ID of the first public subnet
  associate_public_ip_address = true  # Assigns a public IP address to the instance

  key_name = "RedKeys"

  tags = { 
    Name = "RedLion"  # Replace with your desired name for the VM
  }
}

resource "aws_instance" "Red2" {
  ami           = "ami-0dda7e535b65b6469"  # Redhat
  instance_type = "t2.micro"  # Replace with your desired instance type

  subnet_id = aws_subnet.my_subnet[1].id  # Replace with the ID of the second public subnet
  associate_public_ip_address = true  # Assigns a public IP address to the instance

  key_name = "RedKeys"

  tags = { 
    Name = "RedTiger"  # Replace with your desired name for the VM
  }
}
