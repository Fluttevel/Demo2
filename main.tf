provider "aws" {
  region      = "us-east-2"
}

# Creating resources EC2 Instance
resource "aws_launch_configuration" "example" {
  image_id      = "ami-03a0c45ebc70f98ea"
  instance_type = "t2.micro"

  # Implicit dependency
  security_groups = [aws_security_group.instance.id]

  # Simple bash script for web site HelloWorld.html
  user_data = <<EOF
#!/bin/bash
sudo apt-get update
sudo apt-get install apache2
# myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "WEB Server" > var/www/html/index.html
# sudo service apache2 start
EOF

  # Требуется при использовании группы автомасштабирования в конфигурации запуска
  lifecycle {
    create_before_destroy = true
  }
}