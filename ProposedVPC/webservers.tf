resource "aws_instance" "Red1" {
  ami           = "ami-0dda7e535b65b6469"  # Redhat
  instance_type = "t2.micro"  # Replace with your desired instance type

  subnet_id = aws_subnet.my_subnet_1.id  # Replace with the ID of the first public subnet
  associate_public_ip_address = true  # Assigns a public IP address to the instance
  security_groups = [aws_security_group.web_access.id]

  key_name = "RedKeys"

  user_data = <<-EOT
    #!/bin/bash
    sudo echo -e "[main]\nenabled=1" > /etc/yum/pluginconf.d/subscription-manager.conf
    sudo yum install httpd -y
    sudo systemctl enable --now httpd
    sudo chmod 777 /var/www/html
    echo -e "<html>\n <body>\n  <h1>Welcome to Desire's Lion Test Site</h1>\n </body>\n</html>" > /var/www/html/index.html
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
    sudo echo -e "[main]\nenabled=1" > /etc/yum/pluginconf.d/subscription-manager.conf
    sudo yum install httpd -y
    sudo systemctl enable --now httpd
    sudo chmod 777 /var/www/html
    echo -e "<html>\n <body>\n  <h1>Welcome to Desire's Tiger Test Site</h1>\n </body>\n</html>" > /var/www/html/index.html
  EOT

  tags = { 
    Name = "RedTiger"  # Replace with your desired name for the VM
  }
}
