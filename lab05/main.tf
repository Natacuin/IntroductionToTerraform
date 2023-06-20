resource "aws_iam_user" "admin-user" {
  name = "Juan_Perez"
  tags = {
    Description = "Admin user ABC project."
  }
}

# Create a security group
resource "aws_security_group" "mySecurityGroup" {
  name        = "mySecurityGroup"
  description = "My Security Group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an EC2 instance
resource "aws_instance" "myEC2Instance" {
  ami             = "ami-07dfed28fcf95241c" # Replace with your desired AMI ID
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.mySecurityGroup.name]

  tags = {
    Name = "MyEC2Instance"
  }
}


