# Task-Terraform
## 0-provider.tf:
  - This file defines the provider block for AWS, specifying the region where the AWS resources will be created.

## 1-vpc.tf:
  - Creates a Virtual Private Cloud (VPC) with the CIDR block 10.0.0.0/16.
  - Defines two subnets within the VPC:
    - One public subnet with CIDR block 10.0.1.0/24.
    - One private subnet with CIDR block 10.0.2.0/24.

## 2-ec2.tf:
  - Defines a security group (aws_security_group) named ec2_sg for the EC2 instance.
    - Allows all outbound traffic (egress) and SSH (port 22) inbound traffic (ingress) from anywhere.
  - Defines an EC2 instance (aws_instance) named my_ec2.
    - Specifies an AMI ID, instance type, subnet ID (for the public subnet), and associates it with the ec2_sg security group.
    - Enables the instance to have a public IP address (associate_public_ip_address).

## 3-rds.tf:
  - Defines a security group (aws_security_group) named rds_sg for the RDS instance.
    - Allows all outbound traffic (egress) and MySQL (port 3306) inbound traffic (ingress) from the security group associated with the EC2 instance (ec2_sg).
  - Defines an RDS instance (aws_db_instance) named my_rds.
    - Specifies parameters such as allocated storage, database engine, instance class, username, password, subnet group, and associates it with the rds_sg security group.

## variable.tf:
  - Defines variables that can be used throughout the configuration to parameterize values like region, AMI, instance type, and database password.

## output.tf:
   - Defines outputs that can be useful after applying the Terraform configuration, such as the public IP address of the EC2 instance and the endpoint of the RDS instance.

## main.tf:
   - The entry point of the configuration.
   - Specifies the required Terraform version.
   - Configures the AWS provider.
   - Utilizes modules (vpc, ec2, rds) to organize and encapsulate related resources.
     - Modules allow you to break down your configuration into reusable components.
     - In this case, the modules correspond to the VPC, EC2 instance, and RDS instance configurations defined in separate files.

### Note
By breaking down the configuration into smaller files, it becomes more modular, easier to read, and maintainable, especially as your infrastructure grows in complexity.
