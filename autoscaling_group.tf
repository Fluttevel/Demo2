resource "aws_autoscaling_group" "example" {
  launch_configuration  = aws_launch_configuration.example.name
  vpc_zone_identifier   = data.aws_subnet_ids.default.ids
  target_group_arns     = [aws_alb_target_group.asg.arn]
  health_check_type     = "ELB"
  min_size              = 2
  max_size              = 10

  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "terraform-asg-example"
  }
}