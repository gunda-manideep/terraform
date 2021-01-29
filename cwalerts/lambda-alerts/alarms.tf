resource "aws_cloudwatch_metric_alarm" "lambda_errors" {
  alarm_name          = "${var.name_prefix}-Lambda_Errors-${element(var.function_name,count.index)}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "Errors"
  count               = length(var.function_name)
  namespace           = "AWS/Lambda"
  period              = var.period
  statistic           = "Average"
  threshold           = var.errors_threshold
  alarm_description   = "Lambda function is erroring on invocation"
  alarm_actions       = ["${aws_sns_topic.lambda_alerts.arn}"]
  ok_actions          = ["${aws_sns_topic.lambda_alerts.arn}"]
  treat_missing_data  = "notBreaching"
  dimensions = {
    FunctionName       = "${element(var.function_name,count.index)}" 
  }
}
