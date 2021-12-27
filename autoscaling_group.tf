resource "aws_autoscaling_group" "example" {
  launch_configuration  = aws_launch_configuration.example.name
  max_size              = 2
  min_size              = 10

  tag = {
    key = "Name"
    value = "terraform-asg-example"
    propagate_at_launch = true
  }
}