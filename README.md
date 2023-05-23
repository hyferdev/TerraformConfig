# TerraformConfig

Building a VPC for a small organization in AWS with 4 subnets with 2 of them being private. I am then creating the public and private route tables and associating them with the appropriate subnets. Last I am setting up an Internet Gateway for our public subnets that will allow http traffic. This is a work-in-progress and feel free to use. 

5/8/2023

Added 2 VMs to the public subnets and made sure they receive public IPs and get an SSH key
Found issue with default security groups not allowing ssh traffic, resolution coming soon.
Changed the organization of files by creating an EC2 creation module.

5/10/2023

Added a security group that will allow ssh traffic to every device in your VPC. Working on restricting it to the public interfaces only to test for http/s traffic in the future.

5/15/2023

Today we modified the security group to only allow traffic from a specified IP address, which is defined in a terraform cloud variable. We also optimized traffic flow by specifying which availability zone the subnets are set up. This also elimanates the ocasional issue with subnets in us-west-2d, as they do not allow t2.micros to be built.

5/22/2023

Our current goal is to set up our 2 web servers with Terraform. As of now it spins up 2 basic RHEL 9 instances that we would like the code to install httpd and be reachable externally on the web. We were able to manually do this and have started working on the script to pass to the devices through user data blocks. We also fixed our security groups and set them to be associated to the devices. Will be finishing up the script soon™.
