resource "aws_instance" "Red1" {
  ami           = "ami-0dda7e535b65b6469"  # Redhat
  instance_type = "t2.micro"  # Replace with your desired instance type

  subnet_id = aws_subnet.my_subnet_1.id  # Replace with the ID of the first public subnet
  associate_public_ip_address = true  # Assigns a public IP address to the instance
  security_groups = [aws_security_group.web_access.id]

  key_name = "RedKeys"

  user_data = <<-EOT
    #!/bin/bash
    sudo touch /test
  EOT

  tags = { 
    Name = "RedLion"  # Replace with your desired name for the VM
  }
}

resource "aws_instance" "Red2" {
  ami           = "ami-0dda7e535b65b6469"  # Redhat
  instance_type = "t2.micro"  # Replace with your desired instance type

  subnet_id = aws_subnet.my_subnet_2.id  # Replace with the ID of the second public subnet
  associate_public_ip_address = true  # Assigns a public IP address to the instance
  security_groups = [aws_security_group.web_access.id]

  key_name = "RedKeys"

  user_data = <<-EOT
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl enable --now httpd
  EOT

  tags = { 
    Name = "RedTiger"  # Replace with your desired name for the VM
  }
}
