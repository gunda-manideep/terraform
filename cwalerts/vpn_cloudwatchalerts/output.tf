output "sns_topic_arn" {
  description = "The ARN of the SNS topic"
  value       = "${aws_sns_topic.vpn_alerts.arn}"
}
output "alarm_id" {
  description = "List of created alarm names"
  value       = "${aws_cloudwatch_metric_alarm.TunnelStatealarm.*.id}"
}

