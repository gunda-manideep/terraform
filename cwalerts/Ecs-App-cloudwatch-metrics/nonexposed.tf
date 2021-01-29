resource "aws_cloudwatch_metric_alarm" "DesiredTaskCount" {
  count               = length(var.nonexposedservices)
  alarm_name          = "${var.name_prefix}-DesiredTaskCount-${var.nonexposedservices[count.index]["taskdef_name"]}"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "DesiredTaskCount"
  namespace           = "AWS/ContainerInsights"
  period              = var.period
  statistic           = "Average"
  actions_enabled     = var.alarm_actions_enabled
  threshold           = var.taskcount_threshold

  dimensions={
    ClusterName = var.ecs_cluster_name
    ServiceName = var.nonexposedservices[count.index]["taskdef_name"]
  }

  alarm_actions     = ["${aws_sns_topic.ecs.arn}"]
  depends_on = [
    aws_ecs_cluster.cluster,
    aws_ecs_service.ecs-service-nonexposed,
  ]
}

resource "aws_cloudwatch_metric_alarm" "memory_utilization_high" {
  count               = length(var.nonexposedservices)
  alarm_name          = "${var.name_prefix}-High-memory-${var.nonexposedservices[count.index]["taskdef_name"]}"
  alarm_description   = "ContainerInsights Service memory utilization metric under threshold"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "MemoryUtilized"
  namespace           = "AWS/ContainerInsights"
  statistic           = "Average"
  period              = var.period
  threshold           = local.thresholds["MemoryUtilizationHighThreshold"]
  actions_enabled     = var.alarm_actions_enabled
  alarm_actions       = ["${aws_sns_topic.ecs.arn}"]
  dimensions = {
    ClusterName = var.ecs_cluster_name
    ServiceName = var.nonexposedservices[count.index]["taskdef_name"]
}
depends_on = [
    aws_ecs_cluster.cluster,
    aws_ecs_service.ecs-service-nonexposed,
  ]

}
resource "aws_cloudwatch_metric_alarm" "cpu_utilization_high" {
  count               = length(var.nonexposedservices)
  alarm_name          = "${var.name_prefix}-Cpu-high-${var.nonexposedservices[count.index]["taskdef_name"]}"
  alarm_description   = "ContainerInsights Service cpu utilization metric under threshold"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "CpuUtilized"
  namespace           = "AWS/ContainerInsights"
  statistic           = "Average"
  period              = var.period
  threshold           = local.thresholds["CPUUtilizationHighThreshold"]
  actions_enabled     = var.alarm_actions_enabled
  alarm_actions       = ["${aws_sns_topic.ecs.arn}"]
  dimensions = {
    ServiceName = var.nonexposedservices[count.index]["taskdef_name"]
    ClusterName = var.ecs_cluster_name
}
depends_on = [
    aws_ecs_cluster.cluster,
    aws_ecs_service.ecs-service-nonexposed,
  ]

}

locals {
  thresholds = {
    CPUUtilizationHighThreshold    = min(max(var.cpu_utilization_high_threshold, 0), 100)
    MemoryUtilizationHighThreshold = min(max(var.memory_utilization_high_threshold, 0), 100)
}
}
resource "aws_cloudwatch_metric_alarm" "cpu_reservation_high" {
  count               = length(var.nonexposedservices)
  alarm_name          = "${var.name_prefix}-CPU_Reservation_high-${var.nonexposedservices[count.index]["taskdef_name"]}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "CpuReserved"
  namespace           = "AWS/ContainerInsights"
  period              = var.period
  statistic           = "Maximum"
  threshold           = var.cpu_reservation_high_threshold
  treat_missing_data  = "notBreaching"

  dimensions= {
   ClusterName = var.ecs_cluster_name
   ServiceName = var.nonexposedservices[count.index]["taskdef_name"]
   }
  
  alarm_description = "CPU Reservation peaked at 80% during the last minute"
  alarm_actions     = ["${aws_sns_topic.ecs.arn}"]
  depends_on = [
    aws_ecs_cluster.cluster,
    aws_ecs_service.ecs-service-nonexposed,
  ]

  
}
resource "aws_cloudwatch_metric_alarm" "cpu_reservation_low" {
  count               = length(var.nonexposedservices)
  alarm_name          = "${var.name_prefix}-Cpu_reservation_low-${var.nonexposedservices[count.index]["taskdef_name"]}"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "CPUReserved"
  namespace           = "AWS/ContainerInsights"
  period              = var.period
  statistic           = "Maximum"
  threshold           = var.cpu_reservation_low_threshold
  treat_missing_data  = "notBreaching"

  dimensions ={
     ClusterName = var.ecs_cluster_name
    ServiceName = var.nonexposedservices[count.index]["taskdef_name"]
  }

  alarm_description = "CPU Reservation is under 40% for the last 20 min"
  alarm_actions     = ["${aws_sns_topic.ecs.arn}"]
  depends_on = [
    aws_ecs_cluster.cluster,
    aws_ecs_service.ecs-service-nonexposed,
  ]
}
resource "aws_cloudwatch_metric_alarm" "memory_reservation_high" {
  count               = length(var.nonexposedservices)
  alarm_name          = "${var.name_prefix}-Memory_reservation-high-${var.nonexposedservices[count.index]["taskdef_name"]}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "MemoryReserved"
  namespace           = "AWS/ContainerInsights"
  period              = var.period
  statistic           = "Average"
  threshold           = var.memory_reservation_high_threshold

  dimensions={
    ServiceName = var.nonexposedservices[count.index]["taskdef_name"]
    ClusterName = var.ecs_cluster_name
  }

  alarm_actions     = ["${aws_sns_topic.ecs.arn}"]
  depends_on = [
    aws_ecs_cluster.cluster,
    aws_ecs_service.ecs-service-nonexposed,
  ]

}
resource "aws_cloudwatch_metric_alarm" "Service_count" {
  count               = length(var.nonexposedservices)
  alarm_name          = "${var.name_prefix}-Service-count-${var.nonexposedservices[count.index]["taskdef_name"]}"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "ServiceCount"
  namespace           = "AWS/ContainerInsights"
  period              = var.period
  statistic           = "Average"
  threshold           = var.Service_count_threshold

  dimensions={
    ServiceName = var.nonexposedservices[count.index]["taskdef_name"]
    ClusterName = var.ecs_cluster_name
  }

  alarm_actions     = ["${aws_sns_topic.ecs.arn}"]
  depends_on = [
    aws_ecs_cluster.cluster,
    aws_ecs_service.ecs-service-nonexposed,
  ]

}

resource "aws_cloudwatch_metric_alarm" "Task_count" {
  count               = length(var.nonexposedservices)
  alarm_name          = "${var.name_prefix}-Task-count-${var.nonexposedservices[count.index]["taskdef_name"]}"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "TaskCount"
  namespace           = "AWS/ContainerInsights"
  period              = var.period
  statistic           = "Average"
  threshold           = var.task_count_threshold

  dimensions={
    ServiceName = var.nonexposedservices[count.index]["taskdef_name"]
    ClusterName = var.ecs_cluster_name
  }

  alarm_actions     = ["${aws_sns_topic.ecs.arn}"]
  depends_on = [
    aws_ecs_cluster.cluster,
    aws_ecs_service.ecs-service-nonexposed,
  ]
}
resource "aws_cloudwatch_metric_alarm" "Running_Task_count" {
  count               = length(var.nonexposedservices)
  alarm_name          = "${var.name_prefix}-Running_Task_count-${var.nonexposedservices[count.index]["taskdef_name"]}"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "RunningTaskCount"
  namespace           = "AWS/ContainerInsights"
  period              = var.period
  statistic           = "Average"
  threshold           = var.running_task_count_threshold

  dimensions={
    ServiceName = var.nonexposedservices[count.index]["taskdef_name"]
    ClusterName = var.ecs_cluster_name
  }

  alarm_actions     = ["${aws_sns_topic.ecs.arn}"]
  depends_on = [
    aws_ecs_cluster.cluster,
    aws_ecs_service.ecs-service-nonexposed,
  ]
}

