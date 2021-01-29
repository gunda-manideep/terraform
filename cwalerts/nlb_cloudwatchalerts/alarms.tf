resource "aws_cloudwatch_metric_alarm" "unhealthyhostcountalarm" {
  alarm_name          = "${var.name_prefix}-NetworkELB_UnHealthyHostCount-${element(var.targetgroup, count.index)}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/NetworkELB"
  period              = var.period
  statistic           = var.statistic
  evaluation_periods  = var.evaluation_periods
  threshold           = var.threshold
  alarm_actions = ["${aws_sns_topic.nlb_alerts.arn}"]
  ok_actions    = ["${aws_sns_topic.nlb_alerts.arn}"]
  count                     = length(var.targetgroup)
  treat_missing_data = "notBreaching"
  dimensions={ TargetGroup = "${element(var.targetgroup, count.index)}", LoadBalancer = "${element(var.networkloadbalancername,count.index)}"}
}

