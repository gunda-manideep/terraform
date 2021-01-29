locals {
  thresholds = {
   SwapUsageThreshold        = "${max(var.swap_usage_threshold, 0)}"
  }
}
resource "aws_cloudwatch_metric_alarm" "elasticache_cpuutilization" {
  alarm_name          = "${var.name_prefix}-ElastiCache_CPUUtilization-${element(var.cache_cluster_id,count.index)}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ElastiCache"
  period              = var.period
  count               = length(var.cache_cluster_id)
  statistic           = "Average"
  threshold           = "${var.cpuutilization_threshold}"
  actions_enabled     = true
  alarm_actions       = ["${aws_sns_topic.elastiCache_alarms.arn}"]
  ok_actions          = ["${aws_sns_topic.elastiCache_alarms.arn}"]
  treat_missing_data  = "notBreaching"
  alarm_description   = "This metric monitors the percentage of CPU utilization."

  dimensions = {
    CacheClusterId = "${element(var.cache_cluster_id,count.index)}"
  }
}
#resource "aws_cloudwatch_metric_alarm" "elasticache_Enginecpuutilization" {
 # alarm_name          = "${var.name_prefix}-ElastiCache_Enginecpuutilization-${element(var.cache_cluster_id,count.index)}"
 # comparison_operator = "GreaterThanOrEqualToThreshold"
#  evaluation_periods  = var.evaluation_periods
#  metric_name         = "EngineCPUUtilization"
#  namespace           = "AWS/ElastiCache"
#  period              = var.period
 # count               = length(var.cache_cluster_id)
 # statistic           = "Average"
 # threshold           = "${var.enginecpuutilization_threshold}"
 # actions_enabled     = true
 # alarm_actions       = ["${aws_sns_topic.elastiCache_alarms.arn}"]
 # alarm_description   = "This metric monitors the percentage of CPU utilization."
 # ok_actions          = ["${aws_sns_topic.elastiCache_alarms.arn}"]
 # treat_missing_data  = "notBreaching"
 # dimensions = {
  #  CacheClusterId = "${element(var.cache_cluster_id,count.index)}"
 # }
#}
resource "aws_cloudwatch_metric_alarm" "swap_usage_too_high" {
  alarm_name          = "${var.name_prefix}-ElastiCache_SwapUsage-${element(var.cache_cluster_id,count.index)}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "SwapUsage"
  namespace           = "AWS/ElastiCache"
  period              = var.period
  count               = length(var.cache_cluster_id)
  statistic           = "Average"
  threshold           = "${local.thresholds["SwapUsageThreshold"]}"
  alarm_description   = "Average elastiCache swap usage over last 10 minutes too high, performance may suffer"
  alarm_actions       = ["${aws_sns_topic.elastiCache_alarms.arn}"]
  ok_actions          = ["${aws_sns_topic.elastiCache_alarms.arn}"]
  treat_missing_data  = "notBreaching"
  dimensions = {
   CacheClusterId = "${element(var.cache_cluster_id,count.index)}"
  }
}
#resource "aws_cloudwatch_metric_alarm" "Replication_lag" {
#  alarm_name          = "${var.name_prefix}-ElastiCache_ReplicationLag-${element(var.cache_cluster_id,count.index)}"
#  comparison_operator = "GreaterThanThreshold"
#  evaluation_periods  = var.evaluation_periods
#  metric_name         = "ReplicationLag"
#  namespace           = "AWS/ElastiCache"
#  count               = length(var.cache_cluster_id)
#  period              = var.period
#  statistic           = "Average"
#  threshold           = var.replication_threshold
#  alarm_actions       = ["${aws_sns_topic.elastiCache_alarms.arn}"]
#  ok_actions          = ["${aws_sns_topic.elastiCache_alarms.arn}"]
#  treat_missing_data  = "notBreaching" 
#  dimensions = {
#   CacheClusterId = "${element(var.cache_cluster_id,count.index)}"
#  }
#}

