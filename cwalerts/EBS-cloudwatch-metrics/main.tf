locals {
  thresholds = {
    BurstBalanceThreshold = "${max(var.burst_balance_threshold, 0)}"
  }
}
resource "aws_cloudwatch_metric_alarm" "ebs_volumequeuelength" {
  alarm_name          = "${var.name_prefix}-EBS_VolumeQueueLength-${element(var.volume_id,count.index)}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  datapoints_to_alarm = var.datapoints_to_alarm
  metric_name         = "VolumeQueueLength"
  namespace           = "AWS/EBS"
  period              = var.period
  count               = length(var.volume_id)
  statistic           = "Average"
  threshold           = "${var.volumequeuelength_threshold}"
  actions_enabled     = true
  alarm_actions       = ["${aws_sns_topic.ebs-alarm.arn}"]
  alarm_description   = "This metric monitors the number of read and write operation requests waiting to be completed in an EBS volume"
  ok_actions          = ["${aws_sns_topic.ebs-alarm.arn}"]
  treat_missing_data  = "notBreaching"
  dimensions = {
    VolumeId = "${element(var.volume_id,count.index)}"
  }
}

resource "aws_cloudwatch_metric_alarm" "iops" {
  alarm_name          = "${var.name_prefix}-EBS_Volumeiops-${element(var.volume_id,count.index)}" 
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  datapoints_to_alarm = var.datapoints_to_alarm
  count               = length(var.volume_id)
  threshold           = var.iopsthreshold
  actions_enabled     = true
  alarm_actions       = ["${aws_sns_topic.ebs-alarm.arn}"]
  alarm_description   = "This metric monitors the number of read and write operation requests waiting to be completed in an EBS volume"
  ok_actions          = ["${aws_sns_topic.ebs-alarm.arn}"]

 metric_query {
    id          = "e1"
    expression  = "SUM(METRICS())"
    label       = "IOPS"
    return_data = "true"
  }  
 
   metric_query {
    id = "m1"

    metric {
      metric_name = "VolumeReadOps"
      namespace   = "AWS/EBS"
      period      = var.period
      stat        = "Average"
      unit        = "Count"

      dimensions = {
        VolumeId = "${element(var.volume_id,count.index)}"
      }
    }
  }

  metric_query {
    id = "m2"

    metric {
      metric_name = "VolumeWriteOps"
      namespace   = "AWS/EBS"
      period      = var.period
      stat        = "Average"
      unit        = "Count"
      dimensions = {
        VolumeId = "${element(var.volume_id,count.index)}"
      }

    }
  } 
}

resource "aws_cloudwatch_metric_alarm" "burst_balance_too_low" {
  alarm_name          = "${var.name_prefix}-EBS_BurstBalance-${element(var.volume_id,count.index)}"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = var.evaluation_periods
  datapoints_to_alarm = var.datapoints_to_alarm
  metric_name         = "BurstBalance"
  namespace           = "AWS/EBS"
  count               = length(var.volume_id)
  period              = var.period
  statistic           = "Average"
  threshold           = "${local.thresholds["BurstBalanceThreshold"]}"
  alarm_description   = "Average burst  balance over last 5 minutes too low, expect a significant performance drop soon"
  alarm_actions       = ["${aws_sns_topic.ebs-alarm.arn}"]
  treat_missing_data  = "notBreaching"
  ok_actions          = ["${aws_sns_topic.ebs-alarm.arn}"]

  dimensions= {
    VolumeId = "${element(var.volume_id,count.index)}"
  }
}

