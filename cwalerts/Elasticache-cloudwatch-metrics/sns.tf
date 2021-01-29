resource "aws_sns_topic" "elastiCache_alarms" {
  name = "Elasticcache_alerts"
  delivery_policy = <<EOF
{
  "http": {
    "defaultHealthyRetryPolicy": {
      "minDelayTarget": 20,
      "maxDelayTarget": 20,
      "numRetries": 3,
      "numMaxDelayRetries": 0,
      "numNoDelayRetries": 0,
      "numMinDelayRetries": 0,
      "backoffFunction": "linear"
    },
    "disableSubscriptionOverrides": false,
    "defaultThrottlePolicy": {
      "maxReceivesPerSecond": 1
    }
  }
}
EOF
}
resource "null_resource" "multiple_emails" {
depends_on = [aws_sns_topic.elastiCache_alarms]
count      =length(var.emails)
  provisioner "local-exec" {
    command = "aws sns subscribe --topic-arn ${aws_sns_topic.elastiCache_alarms.arn} --protocol email --notification-endpoint ${element(var.emails, count.index)}"
  }
}
