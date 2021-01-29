resource "aws_sns_topic" "dynamodb_alerts" {
  name = "dynamodb-alerts"
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
depends_on = [aws_sns_topic.dynamodb_alerts]
count      =length(var.alarms_email)
  provisioner "local-exec" {
    command = "aws sns subscribe --topic-arn ${aws_sns_topic.dynamodb_alerts.arn} --protocol email --notification-endpoint ${element(var.alarms_email, count.index)}"
  }
}

