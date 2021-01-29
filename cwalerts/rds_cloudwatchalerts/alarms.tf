locals {
  thresholds = {
#    BurstBalanceThreshold     = "${min(max(var.burst_balance_threshold, 0), 100)}"
#    CPUCreditBalanceThreshold = "${max(var.cpu_credit_balance_threshold, 0)}"
 #   DiskQueueDepthThreshold   = "${max(var.disk_queue_depth_threshold, 0)}"
#    SwapUsageThreshold        = "${max(var.swap_usage_threshold, 0)}"
 #   WriteLatencyThreshold     = "${max(var.WriteLatencyThreshold, 0)}"
  #  WriteIOPSThreshold        = "${max(var.WriteIOPSThreshold , 0)}"
   # ReadIOPSThreshold         = "${max(var.ReadIOPSThreshold, 0)}"
    DatabaseConnectionsThreshold = "${max(var.DatabaseConnectionsThreshold, 0)}"
    CPUUtilizationThreshold     = "${max(var.CPUUtilizationThreshold, 0)}"
  #  BurstBalanceThreshold      = "${max(var.BurstBalanceThreshold, 0)}"
  #  FreeStorageSpaceThreshold  = "${max(var.FreeStorageSpaceThreshold, 0)}"
    FreeableMemoryThreshold   = "${max(var.FreeableMemoryThreshold, 0)}"
    DeadlockThreshold         = "${max(var.DeadlockThreshold,0)}"
  #  BinLogDiskUsageThreshold  = "${max(var.BinLogDiskUsageThreshold, 0)}"
   }
}

#resource "aws_cloudwatch_metric_alarm" "burst_balance_too_low" {
 # alarm_name          = "${var.name_prefix}-RDS_BurstBalance-${element(var.dbinstanceids, count.index)}"
 # comparison_operator = "LessThanThreshold"
 # count               = length(var.dbinstanceids)
 # evaluation_periods  = var.evaluation_periods
 # metric_name         = "BurstBalance"
 # namespace           = "AWS/RDS"
 # period              = var.period
 # statistic           = "Average"
 # threshold           = "${local.thresholds["BurstBalanceThreshold"]}"
 # alarm_description   = "Average database storage burst balance over last 10 minutes too low, expect a significant performance drop soon"
 # alarm_actions       = ["${aws_sns_topic.rds_alerts.arn}"]
 # ok_actions          = ["${aws_sns_topic.rds_alerts.arn}"]
 # treat_missing_data  = "notBreaching"
 # dimensions = {
 # DBInstanceIdentifier= "${element(var.dbinstanceids, count.index)}" 
#}
#}

#resource "aws_cloudwatch_metric_alarm" "cpu_credit_balance_too_low" {
#  alarm_name          = "${var.name_prefix}-cpu_credit_balance_too_low-${element(var.dbinstanceids, count.index)}"
#  comparison_operator = "LessThanThreshold"
#  count               = length(var.dbinstanceids)
#  evaluation_periods  = var.evaluation_periods
#  metric_name         = "CPUCreditBalance"
#  namespace           = "AWS/RDS"
#  period              = var.period
#  statistic           = "Average"
#  threshold           = "${local.thresholds["CPUCreditBalanceThreshold"]}"
#  alarm_description   = "Average database CPU credit balance over last 10 minutes too low, expect a significant performance drop soon"
#  alarm_actions       = ["${aws_sns_topic.rds_alerts.arn}"]
#  ok_actions          = ["${aws_sns_topic.rds_alerts.arn}"]
#  treat_missing_data  = "notBreaching"
#  dimensions = { 
#DBInstanceIdentifier= "${element(var.dbinstanceids, count.index)}"         
#}
#}
#resource "aws_cloudwatch_metric_alarm" "disk_queue_depth_too_high" {
#  alarm_name          = "${var.name_prefix}-disk_queue_depth_too_high-${element(var.dbinstanceids, count.index)}"
#  comparison_operator = "GreaterThanThreshold"
#  count               = length(var.dbinstanceids)
#  evaluation_periods  = var.evaluation_periods
#  metric_name         = "DiskQueueDepth"
#  namespace           = "AWS/RDS"
#  period              = var.period
#  statistic           = "Average"
#  threshold           = "${local.thresholds["DiskQueueDepthThreshold"]}"
#  alarm_description   = "Average database disk queue depth over last 10 minutes too high, performance may suffer"
#  alarm_actions       = ["${aws_sns_topic.rds_alerts.arn}"]
#  ok_actions          = ["${aws_sns_topic.rds_alerts.arn}"]
#  treat_missing_data  = "notBreaching"
#  dimensions = { 
#DBInstanceIdentifier= "${element(var.dbinstanceids, count.index)}"         
#}
#}


#resource "aws_cloudwatch_metric_alarm" "swap_usage_too_high" {
#  alarm_name          = "${var.name_prefix}-RDS_SwapUsage-${element(var.dbinstanceids, count.index)}"
#  comparison_operator = "GreaterThanThreshold"
 # count               = length(var.dbinstanceids)
 # evaluation_periods  = var.evaluation_periods
 # metric_name         = "SwapUsage"
 # namespace           = "AWS/RDS"
 # period              = var.period
 # statistic           = "Average"
 # threshold           = "${local.thresholds["SwapUsageThreshold"]}"
 # alarm_description   = "Average database swap usage over last 10 minutes too high, performance may suffer"
 # alarm_actions       = ["${aws_sns_topic.rds_alerts.arn}"]
 # ok_actions          = ["${aws_sns_topic.rds_alerts.arn}"]
 # treat_missing_data  = "notBreaching"
#  dimensions = { 
#DBInstanceIdentifier= "${element(var.dbinstanceids, count.index)}"         
#}
#}
resource "aws_cloudwatch_metric_alarm" "RDS_CPUUtilization" {
  alarm_name          = "${var.name_prefix}-RDS_CPUUtilization-${element(var.dbinstanceids, count.index)}"
  comparison_operator = "GreaterThanThreshold"
  count               = length(var.dbinstanceids)
  evaluation_periods  = var.evaluation_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = var.period
  statistic           = "Average"
  threshold           = "${local.thresholds["CPUUtilizationThreshold"]}"
  alarm_description   = "Average database swap usage over last 10 minutes too high, performance may suffer"
  alarm_actions       = ["${aws_sns_topic.rds_alerts.arn}"]
  ok_actions          = ["${aws_sns_topic.rds_alerts.arn}"]
  treat_missing_data  = "notBreaching"
  dimensions = {
DBInstanceIdentifier= "${element(var.dbinstanceids, count.index)}"
}
}
resource "aws_cloudwatch_metric_alarm" "RDS_DatabaseConnections" {
  alarm_name          = "${var.name_prefix}-RDS_DatabaseConnections-${element(var.dbinstanceids, count.index)}"
  comparison_operator = "GreaterThanThreshold"
  count               = length(var.dbinstanceids)
  evaluation_periods  = var.evaluation_periods
  metric_name         = "DatabaseConnections"
  namespace           = "AWS/RDS"
  period              = var.period
  statistic           = "Average"
  threshold           = "${local.thresholds["DatabaseConnectionsThreshold"]}"
  alarm_description   = "Average database swap usage over last 10 minutes too high, performance may suffer"
  alarm_actions       = ["${aws_sns_topic.rds_alerts.arn}"]
  ok_actions          = ["${aws_sns_topic.rds_alerts.arn}"]
  treat_missing_data  = "notBreaching"
  dimensions = {
DBInstanceIdentifier= "${element(var.dbinstanceids, count.index)}"
}
}
#resource "aws_cloudwatch_metric_alarm" "ReadIOPS" {
#  alarm_name          = "${var.name_prefix}-RDS_ReadIOPS-${element(var.dbinstanceids, count.index)}"
#  comparison_operator = "GreaterThanThreshold"
#  count               = length(var.dbinstanceids)
#  evaluation_periods  = var.evaluation_periods
#  metric_name         = "ReadIOPS"
#  namespace           = "AWS/RDS"
#  period              = var.period
 # statistic           = "Average"
 # threshold           = "${local.thresholds["ReadIOPSThreshold"]}"
 # alarm_description   = "Average database swap usage over last 10 minutes too high, performance may suffer"
 # alarm_actions       = ["${aws_sns_topic.rds_alerts.arn}"]
 # ok_actions          = ["${aws_sns_topic.rds_alerts.arn}"]
 # treat_missing_data  = "notBreaching"
 # dimensions = {
#DBInstanceIdentifier= "${element(var.dbinstanceids, count.index)}"
#}
#}
#resource "aws_cloudwatch_metric_alarm" "WriteIOPS" {
#  alarm_name          = "${var.name_prefix}-RDS_WriteIOPS-${element(var.dbinstanceids, count.index)}"
#  comparison_operator = "GreaterThanThreshold"
#  count               = length(var.dbinstanceids)
#  evaluation_periods  = var.evaluation_periods
#  metric_name         = "WriteIOPS"
#  namespace           = "AWS/RDS"
#  period              = var.period
#  statistic           = "Average"
#  threshold           = "${local.thresholds["WriteIOPSThreshold"]}"
#  alarm_description   = "Average database swap usage over last 10 minutes too high, performance may suffer"
#  alarm_actions       = ["${aws_sns_topic.rds_alerts.arn}"]
#  ok_actions          = ["${aws_sns_topic.rds_alerts.arn}"]
#  treat_missing_data  = "notBreaching"
#  dimensions = {
#DBInstanceIdentifier= "${element(var.dbinstanceids, count.index)}"
#}
#}
#resource "aws_cloudwatch_metric_alarm" "RDS_WriteLatency" {
#  alarm_name          = "${var.name_prefix}-RDS_WriteLatency-${element(var.dbinstanceids, count.index)}"
#  comparison_operator = "GreaterThanThreshold"
#  count               = length(var.dbinstanceids)
#  evaluation_periods  = var.evaluation_periods
#  metric_name         = "WriteLatency"
#  namespace           = "AWS/RDS"
#  period              = var.period
#  statistic           = "Average"
#  threshold           = "${local.thresholds["WriteLatencyThreshold"]}"
#  alarm_description   = "Average database swap usage over last 10 minutes too high, performance may suffer"
#  alarm_actions       = ["${aws_sns_topic.rds_alerts.arn}"]
#  ok_actions          = ["${aws_sns_topic.rds_alerts.arn}"]
#  treat_missing_data  = "notBreaching"
#  dimensions = {
#DBInstanceIdentifier= "${element(var.dbinstanceids, count.index)}"
#}
#}
#resource "aws_cloudwatch_metric_alarm" "RDS_FreeStorageSpace" {
 # alarm_name          = "${var.name_prefix}-RDS_FreeStorageSpace-${element(var.dbinstanceids, count.index)}"
 # comparison_operator = "GreaterThanThreshold"
 # count               = length(var.dbinstanceids)
 # evaluation_periods  = var.evaluation_periods
 # metric_name         = "FreeStorageSpace"
 # namespace           = "AWS/RDS"
 # period              = var.period
 # statistic           = "Average"
 # threshold           = "${local.thresholds["FreeStorageSpaceThreshold"]}"
 # alarm_description   = "Average database swap usage over last 10 minutes too high, performance may suffer"
#  alarm_actions       = ["${aws_sns_topic.rds_alerts.arn}"]
#  ok_actions          = ["${aws_sns_topic.rds_alerts.arn}"]
#  treat_missing_data  = "notBreaching"
#  dimensions = {
#DBInstanceIdentifier= "${element(var.dbinstanceids, count.index)}"
#}
#}
resource "aws_cloudwatch_metric_alarm" "RDS_FreeableMemory" {
  alarm_name          = "${var.name_prefix}-RDS_FreeableMemory-${element(var.dbinstanceids, count.index)}"
  comparison_operator = "GreaterThanThreshold"
  count               = length(var.dbinstanceids)
  evaluation_periods  = var.evaluation_periods
  metric_name         = "FreeableMemory"
  namespace           = "AWS/RDS"
  period              = var.period
  statistic           = "Average"
  threshold           = "${local.thresholds["FreeableMemoryThreshold"]}"
#  alarm_description   = "Average database swap usage over last 10 minutes too high, performance may suffer"
  alarm_actions       = ["${aws_sns_topic.rds_alerts.arn}"]
  ok_actions          = ["${aws_sns_topic.rds_alerts.arn}"]
  treat_missing_data  = "notBreaching"
  dimensions = {
DBInstanceIdentifier= "${element(var.dbinstanceids, count.index)}"
}
}
#resource "aws_cloudwatch_metric_alarm" "RDS_BinLogDiskUsage" {
 # alarm_name          = "${var.name_prefix}-RDS_BinLogDiskUsage-${element(var.dbinstanceids, count.index)}"
 # comparison_operator = "GreaterThanThreshold"
 # count               = length(var.dbinstanceids)
 # evaluation_periods  = var.evaluation_periods
 # metric_name         = "BinLogDiskUsage"
 # namespace           = "AWS/RDS"
 # period              = var.period
 # statistic           = "Average"
 # threshold           = "${local.thresholds["BinLogDiskUsageThreshold"]}"
#  alarm_description   = "Average database swap usage over last 10 minutes too high, performance may suffer"
 # alarm_actions       = ["${aws_sns_topic.rds_alerts.arn}"]
 # ok_actions          = ["${aws_sns_topic.rds_alerts.arn}"]
 # treat_missing_data  = "notBreaching"
 # dimensions = {
#DBInstanceIdentifier= "${element(var.dbinstanceids, count.index)}"
#}
#}
resource "aws_cloudwatch_metric_alarm" "RDS_Deadlock" {
  alarm_name          = "${var.name_prefix}-RDS_Deadlock-${element(var.dbinstanceids, count.index)}"
  comparison_operator = "GreaterThanThreshold"
  count               = length(var.dbinstanceids)
  evaluation_periods  = var.evaluation_periods
  metric_name         = "Deadlocks"
  namespace           = "AWS/RDS"
  period              = var.period
  statistic           = "Average"
  threshold           = "${local.thresholds["DeadlockThreshold"]}"
  alarm_description   = "Average database swap usage over last 10 minutes too high, performance may suffer"
  alarm_actions       = ["${aws_sns_topic.rds_alerts.arn}"]
  ok_actions          = ["${aws_sns_topic.rds_alerts.arn}"]
  treat_missing_data  = "notBreaching"
  dimensions = {
DBInstanceIdentifier= "${element(var.dbinstanceids, count.index)}"
}
}

