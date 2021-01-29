resource "aws_cloudwatch_metric_alarm" "TunnelStatealarm" {
  alarm_name          = "${var.name_prefix}-VPN_TunnelState-${element(var.vpnid,count.index)}"
  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods
  metric_name         = "TunnelState"
  namespace           = "AWS/VPN"
  period              = var.period
  count               = length(var.vpnid)
  statistic           = var.statistic
  threshold           = var.TunnelStatethreshold
  dimensions          = {
  VpnId               = "${element(var.vpnid,count.index)}"		
}
  alarm_actions       = ["${aws_sns_topic.vpn_alerts.arn}"]
  ok_actions          = ["${aws_sns_topic.vpn_alerts.arn}"]
  treat_missing_data  = "notBreaching"
}

