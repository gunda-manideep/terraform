resource "aws_autoscaling_notification" "asg_notifications" {
  group_names         = var.groupnames
  notifications       = var.notifications
  topic_arn           = "${aws_sns_topic.asgevents_alerts.arn}"
}

