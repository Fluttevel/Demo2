resource "aws_alb_listener_rule" "asg" {
  listener_arn  = aws_alb_listener.http.arn
  priority      = 100

  condition {
    path_pattern {
      values = ["*"]
    }
  }

  action {
    type = "forward"
    target_group_arn = aws_alb_target_group.asg.arn
  }
}