resource "aws_cloudwatch_metric_alarm" "cpu_utilization" {
  alarm_name          = "${var.name_prefix}-ECS_CPUUtilization-${element(var.ecs_cluster_name,count.index)}"
  alarm_description   = "ECS cluster cpu utilization metric above threshold"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  statistic           = "Average"
  period              = var.period
  threshold           = local.thresholds["CPUUtilizationHighThreshold"]
  count               = length(var.ecs_cluster_name)
  alarm_actions       = ["${aws_sns_topic.ecs_Alarm.arn}"]
  ok_actions        = ["${aws_sns_topic.ecs_Alarm.arn}"]
  treat_missing_data = "notBreaching"
  dimensions = {
    ClusterName = "${element(var.ecs_cluster_name,count.index)}"
  }
}


resource "aws_cloudwatch_metric_alarm" "memory_utilization" {
  alarm_name          = "${var.name_prefix}-ECS_MemoryUtilization-${element(var.ecs_cluster_name,count.index)}"
  alarm_description   = "ECS cluster memory utilization metric under threshold"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "MemoryUtilization"
  namespace           = "AWS/ECS"
  statistic           = "Average"
  period              = var.period
  threshold           = local.thresholds["MemoryUtilizationHighThreshold"]
  count               = length(var.ecs_cluster_name)
  alarm_actions       = ["${aws_sns_topic.ecs_Alarm.arn}"]
  ok_actions        = ["${aws_sns_topic.ecs_Alarm.arn}"]
  treat_missing_data = "notBreaching"
  dimensions = {
    ClusterName = "${element(var.ecs_cluster_name,count.index)}"
  }
}
locals {
  thresholds = {
    CPUUtilizationHighThreshold    = min(max(var.cpu_utilization_high_threshold, 0), 100)
    MemoryUtilizationHighThreshold = min(max(var.memory_utilization_high_threshold, 0), 100)
  }
}
resource "aws_cloudwatch_metric_alarm" "cpu_reservation" {
  alarm_name          = "${var.name_prefix}-ECS_CPUReservation-${element(var.ecs_cluster_name,count.index)}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "CPUReservation"
  namespace           = "AWS/ECS"
  period              = var.period
  statistic           = "Average"
  count               = length(var.ecs_cluster_name)
  threshold           = var.cpu_reservation_high_threshold
  treat_missing_data  = "notBreaching"

  dimensions= {
    ClusterName = "${element(var.ecs_cluster_name,count.index)}"
  }

  alarm_description = "CPU Reservation peaked at 80% during the last minute"
  alarm_actions     = ["${aws_sns_topic.ecs_Alarm.arn}"]
  ok_actions        = ["${aws_sns_topic.ecs_Alarm.arn}"]
}

resource "aws_cloudwatch_metric_alarm" "memory_reservation" {
  alarm_name          = "${var.name_prefix}-ECS_MemoryReservation-${element(var.ecs_cluster_name,count.index)}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "MemoryReservation"
  namespace           = "AWS/ECS"
  period              = var.period
  statistic           = "Average"
  count               = length(var.ecs_cluster_name)
  threshold           = var.memory_reservation_high_threshold
  treat_missing_data  = "notBreaching"

  dimensions={
    ClusterName = "${element(var.ecs_cluster_name,count.index)}"
 }

  alarm_actions     = ["${aws_sns_topic.ecs_Alarm.arn}"]
  ok_actions        = ["${aws_sns_topic.ecs_Alarm.arn}"]   
}

