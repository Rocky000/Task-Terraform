resource "aws_security_group" "ec2_sg" {
  vpc_id = aws_vpc.my_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "my_ec2" {
  ami                    = "ami-0c55b159cbfafe1f0"  # Change to desired AMI
  instance_type          = "t2.micro"  # Change to desired instance type
  subnet_id              = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  security_groups        = [aws_security_group.ec2_sg.id]
}
