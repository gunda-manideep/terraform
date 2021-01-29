locals {
  thresholds = {
    BurstCreditBalanceThreshold = "${max(var.burst_credit_balance_threshold, 0)}"
    PercentIOLimitThreshold     = "${min(max(var.percent_io_limit_threshold, 0), 100)}"
  }

}

resource "aws_cloudwatch_metric_alarm" "burst_credit_balance_too_low" {
  alarm_name          = "${var.name_prefix}-EFS_BurstCreditBalance-${element(var.filesystem_id,count.index)}"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "BurstCreditBalance"
  namespace           = "AWS/EFS"
  period              = var.period
  count               = length(var.filesystem_id)
  statistic           = "Average"
  threshold           = "${local.thresholds["BurstCreditBalanceThreshold"]}"
  alarm_description   = "Average burst credit balance over last 5 minutes too low, expect a significant performance drop soon"
  alarm_actions       = ["${aws_sns_topic.efs_alarm.arn}"]
  ok_actions          = ["${aws_sns_topic.efs_alarm.arn}"]
  treat_missing_data  = "notBreaching"
  dimensions= {
    FileSystemId = "${element(var.filesystem_id,count.index)}"
  }
}

resource "aws_cloudwatch_metric_alarm" "percent_io_limit_too_high" {
  alarm_name          = "${var.name_prefix}-EFS_PercentIOLimit-${element(var.filesystem_id,count.index)}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
metric_name         = "PercentIOLimit"
  namespace           = "AWS/EFS"
  count               = length(var.filesystem_id)
  period              = var.period
  statistic           = "Average"
  threshold           = "${local.thresholds["PercentIOLimitThreshold"]}"
  alarm_description   = "I/O limit has been reached, consider using Max I/O performance mode"
  alarm_actions       = ["${aws_sns_topic.efs_alarm.arn}"]
  ok_actions          = ["${aws_sns_topic.efs_alarm.arn}"]
  treat_missing_data  = "notBreaching"
  dimensions= {
    FileSystemId = "${element(var.filesystem_id,count.index)}"
  }
}
#resource "aws_cloudwatch_metric_alarm" "client_connections" {
 # alarm_name          = "${var.name_prefix}-EFS_ClientConnections-${element(var.filesystem_id,count.index)}"
 #comparison_operator = "GreaterThanThreshold"
 # evaluation_periods  = var.evaluation_periods
 # count               = length(var.filesystem_id)
 # alarm_description   = "Anomalous database connection count detected. Something unusual is happening."
 # alarm_actions       = ["${aws_sns_topic.efs_alarm.arn}"]
 # ok_actions          = ["${aws_sns_topic.efs_alarm.arn}"]
 # period              = var.period
 # metric_name         = "ClientConnections"
 # namespace           = "AWS/EFS"
 # statistic           = "Average"
 # unit                = "Count"
 # threshold           = var.client_connections_threshold
 # treat_missing_data  = "notBreaching"
 # dimensions = {
  #      FileSystemId = "${element(var.filesystem_id,count.index)}"
#}
 #   }
#resource "aws_cloudwatch_metric_alarm" "total_io_bytes" {
 # alarm_name          = "${var.name_prefix}-EFS_TotalIOBytes-${element(var.filesystem_id,count.index)}"
 # comparison_operator = "GreaterThanOrEqualToThreshold"
 # evaluation_periods  = var.evaluation_periods
 # period              = var.period
 # namespace           = "AWS/EFS"
 # metric_name         = "TotalIOBytes"
 # count               = length(var.filesystem_id)
 # statistic           = "Average"
 # threshold           = var.total_io_threshold
 # alarm_description   = "Anomalous IO pattern detected. Something unusual is happening."
 # alarm_actions       = ["${aws_sns_topic.efs_alarm.arn}"]
 # ok_actions          = ["${aws_sns_topic.efs_alarm.arn}"]
 # treat_missing_data  = "notBreaching"
#dimensions = {
 #       FileSystemId = "${element(var.filesystem_id,count.index)}"  
  #    }
  #  }
  

resource "aws_cloudwatch_metric_alarm" "permitted_Throughput" {
  alarm_name          = "${var.name_prefix}-EFS_PermittedThroughput-${element(var.filesystem_id,count.index)}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  period              = var.period
 namespace           = "AWS/EFS"
 metric_name         = "PermittedThroughput"
 count               = length(var.filesystem_id)
  statistic           = "Average"
  threshold           = var.permitted_threshold
  alarm_description   = "Permitted_throughput."
  alarm_actions       = ["${aws_sns_topic.efs_alarm.arn}"]
  ok_actions          = ["${aws_sns_topic.efs_alarm.arn}"]
  treat_missing_data  = "notBreaching"
dimensions = {
        FileSystemId = "${element(var.filesystem_id,count.index)}"
      }
    }

