resource "aws_cloudwatch_metric_alarm" "cluster_failed_node_count" {
  alarm_name          = "${var.name_prefix}-cluster_failed_node_count"
  alarm_description   = "cluster_failed_node_count Alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "cluster_failed_node_count"
  namespace           = "AWS/ContainerInsights"
  statistic           = "Average"
  period              = var.period
  threshold           = var.cluster_failed_threshold
  actions_enabled     = var.alarm_actions_enabled
  count               = var.alarm_actions_enabled ? 1 : 0
  alarm_actions       = ["${aws_insights_alarm_topic.insights_alarm.arn}"]
  dimensions = {
    ClusterName = var.node_name
  }
}
resource "aws_cloudwatch_metric_alarm" "node_cpu_Utilization" {
  alarm_name          = "${var.name_prefix}-node_cpu_utilization"
  alarm_description   = "EKS cluster node cpu utilization metric above threshold"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "node_cpu_utilization"
  namespace           = "AWS/ContainerInsights"
  statistic           = "Average"
  period              = var.period
  threshold           = var.node_cpu_utilization_threshold
  actions_enabled     = var.alarm_actions_enabled
  count               = var.alarm_actions_enabled ? 1 : 0
  alarm_actions       = ["${aws_insights_alarm_topic.insights_alarm.arn}"]
  dimensions = {
    ClusterName = var.node_name
  }
}
resource "aws_cloudwatch_metric_alarm" "node_memory_utilization" {
  alarm_name          = "${var.name_prefix}-node_memory_utilization"
  alarm_description   = "EKS cluster node memory utilization metric above threshold"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "node_memory_utilization"
  namespace           = "AWS/ContainerInsights"
  statistic           = "Average"
  period              = var.period
  threshold           = var.node_memory_utilization_threshold
  actions_enabled     = var.alarm_actions_enabled
  count               = var.alarm_actions_enabled ? 1 : 0
  alarm_actions       = ["${aws_insights_alarm_topic.insights_alarm.arn}"]
  dimensions = {
    ClusterName = var.node_name
  }
}

resource "aws_cloudwatch_metric_alarm" "pod_cpu_utilization" {
  alarm_name          = "${var.name_prefix}-pod_cpu_utilization"
  alarm_description   = "EKS cluster pod cpu utilization metric above threshold"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "pod_cpu_utilization"
  namespace           = "AWS/ContainerInsights"
  statistic           = "Average"
  period              = var.period
  threshold           = var.pod_cpu_utilization_threshold
  actions_enabled     = var.alarm_actions_enabled
  count               = var.alarm_actions_enabled ? 1 : 0
  alarm_actions       = ["${aws_insights_alarm_topic.insights_alarm.arn}"]
  dimensions = {
    ClusterName = var.node_name
  }
}
resource "aws_cloudwatch_metric_alarm" "pod_cpu_utilization_over_pod_limit" {
  alarm_name          = "${var.name_prefix}-pod_cpu_utilization_over_pod_limit"
  alarm_description   = "EKS cluster pod cpu utilization over pod limit metric above threshold"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "pod_cpu_utilization_over_pod_limit"
  namespace           = "AWS/ContainerInsights"
  statistic           = "Average"
  period              = var.period
  threshold           = var.pod_cpu_utilization_over_pod_limit_threshold
  actions_enabled     = var.alarm_actions_enabled
  count               = var.alarm_actions_enabled ? 1 : 0
  alarm_actions       = ["${aws_insights_alarm_topic.insights_alarm.arn}"]
  dimensions = {
    ClusterName = var.node_name
  }
}
resource "aws_cloudwatch_metric_alarm" "pod_memory_utilization" {
  alarm_name          = "${var.name_prefix}-pod_memory_utilization"
  alarm_description   = "EKS cluster pod memory utilization metric above threshold"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "pod_memory_utilization"
  namespace           = "AWS/ContainerInsights"
  statistic           = "Average"
  period              = var.period
  threshold           = var.pod_memory_utilization_threshold
  actions_enabled     = var.alarm_actions_enabled
  count               = var.alarm_actions_enabled ? 1 : 0
  alarm_actions       = ["${aws_insights_alarm_topic.insights_alarm.arn}"]
  dimensions = {
    ClusterName = var.node_name
  }
}
resource "aws_cloudwatch_metric_alarm" "pod_memory_utilization_over_pod_limit" {
  alarm_name          = "${var.name_prefix}-pod_memory_utilization_over_pod_limit"
  alarm_description   = "EKS cluster pod memory utilization over pod limit metric above threshold"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "pod_memory_utilization_over_pod_limit"
  namespace           = "AWS/ContainerInsights"
  statistic           = "Average"
  period              = var.period
  threshold           = var.pod_memory_utilization_over_pod_limit_threshold
  actions_enabled     = var.alarm_actions_enabled
  count               = var.alarm_actions_enabled ? 1 : 0
  alarm_actions       = ["${aws_insights_alarm_topic.insights_alarm.arn}"]
  dimensions = {
    ClusterName = var.node_name
  }
}

