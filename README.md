# TerraformConfig

Building a VPC for a small organization in AWS with 4 subnets with 2 of them being private. I am then creating the public and private route tables and associating them with the appropriate subnets. Last I am setting up an Internet Gateway for our public subnets that will allow http traffic. This is a work-in-progress and feel free to use. 

5/8/2023

Added 2 VMs to the public subnets and made sure they receive public IPs and get an SSH key
Found issue with default security groups not allowing ssh traffic, resolution coming soon.
Changed the organization of files by creating an EC2 creation module.

5/10/2023

Added a security group that will allow ssh traffic to every device in your VPC. Working on restricting it to the public interfaces only to test for http/s traffic in the future.
