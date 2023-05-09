# TerraformConfig

This is a working project. We are building a VPC in AWS with 4 subnets with 2 of them being private. We are then creating the public and private route tables and associating them with the appropriate subnets. Last we are adding a Internet Gateway for our public subnets. As mentioned, this is a work-in-progress and feel free to use. 

5/8/2023
Added 2 VMs to the public subnets and made sure they receive public IPs and get an SSH key
Found issue with default security groups not allowing ssh traffic, resolution coming soon
Changed the organization of files by creating an EC2 creation module
