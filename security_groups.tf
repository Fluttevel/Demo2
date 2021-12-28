# Open input/output traffic Port[8080] (AWS default closed traffic for server EC2)
resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = [var.cidr_0]
  }
}

resource "aws_security_group" "alb" {
  name = "terraform-example-alb"

  # Разрешаем все входящие HTTP-запросы
  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = [var.cidr_0]
  }

  # Разрешаем все исходящие HTTP-запросы
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [var.cidr_0]
  }
}