resource "aws_cloudwatch_metric_alarm" "apigateway-alarm-4xx" {
  alarm_name                = "${var.name_prefix}-APIGateway_4XXError-${element(var.api_name,count.index)}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = var.evaluation_periods
  metric_name               = "4XXError"
  namespace                 = "AWS/ApiGateway"
  period                    = var.period
  count                     = length(var.api_name)
  statistic                 = "Average"
  threshold                 = var.threshold_4xx
  alarm_actions             = [aws_sns_topic.gateway_alarms.arn]
  ok_actions                = [aws_sns_topic.gateway_alarms.arn]
  treat_missing_data       = "notBreaching"
  dimensions = {
     ApiName = "${element(var.api_name,count.index)}"
  }
}

# API Gateway 5xx errors
resource "aws_cloudwatch_metric_alarm" "apigateway-alarm-5xx" {
  alarm_name                = "${var.name_prefix}-APIGateway_5XXError-${element(var.api_name,count.index)}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = var.evaluation_periods
  metric_name               = "5XXError"
  namespace                 = "AWS/ApiGateway"
  period                    = var.period
  count                     = length(var.api_name)
  statistic                 = "Average"
  threshold                 = var.threshold_5xx
  alarm_actions             = [aws_sns_topic.gateway_alarms.arn]
  ok_actions                = [aws_sns_topic.gateway_alarms.arn]
  treat_missing_data       = "notBreaching"
  dimensions = {
    ApiName = "${element(var.api_name,count.index)}"
}
}

resource "aws_cloudwatch_metric_alarm" "apigateway-alarm-latency" {
  alarm_name          = "${var.name_prefix}-APIGateway_Latency-${element(var.api_name,count.index)}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_periods
  namespace           = "AWS/ApiGateway"
  metric_name         = "Latency"
  period              = var.period
  count                     = length(var.api_name)
  statistic           = "Average"
  threshold           = var.threshold_latency
  alarm_actions       = [aws_sns_topic.gateway_alarms.arn]
  ok_actions                = [aws_sns_topic.gateway_alarms.arn]
  treat_missing_data       = "notBreaching"
  dimensions = {
     ApiName = "${element(var.api_name,count.index)}"
   }
}


