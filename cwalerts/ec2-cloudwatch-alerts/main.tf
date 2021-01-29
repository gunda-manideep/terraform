resource "aws_cloudwatch_metric_alarm" "cpu-utilization" {
  alarm_name                = "${var.name_prefix}-EC2_CPUUtilization-${element(var.instance_ids, count.index)}"
  count                     = length(var.instance_ids)
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = var.evaluation_periods
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = var.period
  statistic                 = "Average"
  threshold                 = var.cpu_utilization_threshold
  alarm_description         = "This metric monitors ec2 cpu utilization"
  alarm_actions             = [ "${aws_sns_topic.ec2_alarm.arn}" ]
  ok_actions		    = ["${aws_sns_topic.ec2_alarm.arn}"]
  treat_missing_data        = "notBreaching"

  dimensions = {
    InstanceId = "${element(var.instance_ids, count.index)}"

  }
}
#resource "aws_cloudwatch_metric_alarm" "Disk-read-ops" {
#  alarm_name                = "${var.name_prefix}-EC2_DiskReadOps-${element(var.instance_read_write_ids, count.index)}"
#  comparison_operator       = "GreaterThanOrEqualToThreshold"
#  evaluation_periods        = var.evaluation_periods
#  metric_name               = "DiskReadOps"
#  namespace                 = "AWS/EC2"
 # period                    = var.period
 # count                     = length(var.instance_read_write_ids)
 # statistic                 = "Average"
 # threshold                 = var.Disk_read_ops_threshold
 # alarm_description         = "This metric monitors DiskReadOps"
 # alarm_actions             = [ "${aws_sns_topic.ec2_alarm.arn}" ]
 # ok_actions                = ["${aws_sns_topic.ec2_alarm.arn}"]
 # treat_missing_data        = "notBreaching"
 # dimensions = {
 #   InstanceId = "${element(var.instance_read_write_ids, count.index)}"
#  }
#}
#resource "aws_cloudwatch_metric_alarm" "Disk-write-ops" {
#  alarm_name                = "${var.name_prefix}-EC2_DiskWriteOps-${element(var.instance_read_write_ids, count.index)}"
#  comparison_operator       = "GreaterThanOrEqualToThreshold"
#  evaluation_periods        = var.evaluation_periods
#  count                     = length(var.instance_read_write_ids)
#  metric_name               = "DiskWriteOps"
#  namespace                 = "AWS/EC2"
#  period                    = var.period
 # statistic                 = "Average"
 # threshold                 = var.Disk_write_ops_threshold
 # alarm_description         = "This metric monitors DiskWriteOps"
 # alarm_actions             = [ "${aws_sns_topic.ec2_alarm.arn}" ]
 # ok_actions                = ["${aws_sns_topic.ec2_alarm.arn}"]
 # treat_missing_data        = "notBreaching"
 # dimensions = {
 #   InstanceId = "${element(var.instance_read_write_ids, count.index)}"
#  }
#}
#resource "aws_cloudwatch_metric_alarm" "status_check" {
#  alarm_name          = "${var.name_prefix}-EC2_StatusCheckFailed-${element(var.instance_ids, count.index)}"
#  comparison_operator = "GreaterThanOrEqualToThreshold"
#  evaluation_periods  = var.evaluation_periods
#  count               = length(var.instance_ids)
#  metric_name         = "StatusCheckFailed"
#  namespace           = "AWS/EC2"
#  period              = var.period
#  statistic           = "Average"
#  threshold           = var.status_check_threshold
#  alarm_description   = "This metric monitors ec2 status check."
#  alarm_actions             = [ "${aws_sns_topic.ec2_alarm.arn}" ]
#  ok_actions                = ["${aws_sns_topic.ec2_alarm.arn}"]
#  treat_missing_data        = "notBreaching"
#  dimensions = {
#    InstanceId = "${element(var.instance_ids, count.index)}"
 # }
#}

