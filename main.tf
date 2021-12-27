provider "aws" {
  access_key  = "AKIARTC7X46XGGRF7OPE"
  secret_key  = "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"
  region      = "eu-central-1"
}

resource "aws_instance" "instance" {
  ami           = "ami-042ad9eec03638628"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-instance"
  }
}