resource "aws_cloudwatch_metric_alarm" "NumberOfNotificationsFailedalarm" {
  alarm_name          = "${var.name_prefix}-SNS_NumberOfNotificationsFailed-${element(var.topicname, count.index)}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "NumberOfNotificationsFailed"
  namespace           = "AWS/SNS"
  period              = var.period
  statistic           = "Average"
  threshold           = var.NumberOfNotificationsFailedalarmthreshold
  count               = length (var.topicname)
  dimensions          = {
	TopicName     =   "${element(var.topicname, count.index)}"
}
  alarm_actions       = ["${aws_sns_topic.sns_alerts.arn}"]
  ok_actions          = ["${aws_sns_topic.sns_alerts.arn}"]
  treat_missing_data  = "notBreaching"
}

