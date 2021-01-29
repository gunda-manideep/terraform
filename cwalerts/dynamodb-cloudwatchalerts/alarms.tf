resource "aws_cloudwatch_metric_alarm" "AccountProvisionedReadCapacityUtilizationalarm" {
  alarm_description   = var.alarm_description
  alarm_name          = "${var.name_prefix}-DynamoDB_AccountReadCapacity"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "AccountProvisionedReadCapacityUtilization"
  namespace           = "AWS/DynamoDB"
  period              = var.period
  statistic           = var.statistic
  threshold           = var.AccountProvisionedReadCapacityUtilizationthreshold
  alarm_actions       = ["${aws_sns_topic.dynamodb_alerts.arn}"]
  ok_actions	      = ["${aws_sns_topic.dynamodb_alerts.arn}"]
  treat_missing_data  = "notBreaching"
}
resource "aws_cloudwatch_metric_alarm" "AccountProvisionedWriteCapacityUtilizationalarm" {
  alarm_description   = var.alarm_description
  alarm_name          = "${var.name_prefix}-DynamoDB_AccountWriteCapacity"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "AccountProvisionedWriteCapacityUtilization"
  namespace           = "AWS/DynamoDB"
  period              = var.period
  statistic           = var.statistic
  threshold           = var.AccountProvisionedWriteCapacityUtilizationthreshold
  alarm_actions       = ["${aws_sns_topic.dynamodb_alerts.arn}"]
  ok_actions          = ["${aws_sns_topic.dynamodb_alerts.arn}"]
  treat_missing_data  = "notBreaching"
}
resource "aws_cloudwatch_metric_alarm" "MaxProvisionedTableReadCapacityUtilizationalarm" {
  alarm_description   = var.alarm_description
  alarm_name          = "${var.name_prefix}-DynamoDB_MaxTableReadCapacity"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "MaxProvisionedTableReadCapacityUtilization"
  namespace           = "AWS/DynamoDB"
  period              = var.period
  statistic           = var.statistic
  threshold           = var.MaxProvisionedTableReadCapacityUtilizationthreshold
  alarm_actions       = ["${aws_sns_topic.dynamodb_alerts.arn}"]
  ok_actions          = ["${aws_sns_topic.dynamodb_alerts.arn}"]
  treat_missing_data  = "notBreaching"
}
resource "aws_cloudwatch_metric_alarm" "MaxProvisionedTableWriteCapacityUtilizationalarm" {
  alarm_description   = var.alarm_description
  alarm_name          = "${var.name_prefix}-DynamoDB_MaxTableWriteCapacity"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "MaxProvisionedTableWriteCapacityUtilization"
  namespace           = "AWS/DynamoDB"
  period              = var.period
  statistic           = var.statistic
  threshold           = var.MaxProvisionedTableWriteCapacityUtilizationthreshold
  alarm_actions       = ["${aws_sns_topic.dynamodb_alerts.arn}"]
  ok_actions          = ["${aws_sns_topic.dynamodb_alerts.arn}"]
  treat_missing_data  = "notBreaching"
}
