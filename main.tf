provider "aws" {
  access_key  = var.access_key
  secret_key  = var.secret_key
  region      = "eu-central-1"
}

resource "aws_instance" "instance" {
  ami           = "ami-042ad9eec03638628"
  instance_type = "t2.micro"

  # Implicit dependency
#  vpc_security_group_ids = [aws_security_group.instance.id]

  # Simple bash script for web site HelloWorld.html
#  user_data = <<-EOF
#              #!/bin/bash
#              echo "Hello, World" > index.html
#              nohup busybox httpd -f -p 8080 &
#              EOF

  tags = {
    Name = "terraform-instance"
  }
}

# Open input/output traffic Port[8080] (AWS default closed traffic for server EC2)
#resource "aws_security_group" "instance" {
#  name = "terraform-example-instance"
#
#  ingress {
#    from_port   = 8080
#    to_port     = 8080
#    protocol    = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#}