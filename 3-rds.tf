resource "aws_security_group" "rds_sg" {
  vpc_id = aws_vpc.my_vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port        = 3306  # Assuming MySQL port
    to_port          = 3306
    protocol         = "tcp"
    security_groups = [aws_security_group.ec2_sg.id]  # Allowing access from EC2 instance
  }
}

resource "aws_db_instance" "my_rds" {
  allocated_storage    = 20
  engine               = "mysql"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "admin"
  password             = var.db_password
  subnet_group_name    = "default"
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
}
