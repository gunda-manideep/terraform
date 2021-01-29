resource "aws_cloudwatch_metric_alarm" "lambda_duration" {
  alarm_name          = "${var.name_prefix}-Lambda_Duration-${element(var.function_name,count.index)}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "Duration"
  count               = length(var.function_name)
  namespace           = "AWS/Lambda"
  period              = var.period
  statistic           = "Average"
  threshold           = var.duration_threshold
  alarm_description   = "Lambda function duration"
  alarm_actions       = ["${aws_sns_topic.lambda_duration.arn}"]
  ok_actions          = ["${aws_sns_topic.lambda_duration.arn}"]
  treat_missing_data  = "notBreaching"
  dimensions = {
    FunctionName       = "${element(var.function_name,count.index)}"
  }
}
