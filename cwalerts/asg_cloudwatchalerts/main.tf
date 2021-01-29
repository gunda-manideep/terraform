locals {
  # favor name over alarm name if both are set
  alarm_name             = var.name != "" ? var.name : var.alarm_name
  alert_for     = "asgevents"
  sns_topic_arn = "${var.sns_topic_arn == "" ? aws_sns_topic.asgevents_alerts.arn : var.sns_topic_arn }"
}


data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_caller_identity" "default" {}



resource "aws_sns_topic_policy" "asgevents_cloudwatchalerts" {
  arn    = "${aws_sns_topic.asgevents_alerts.arn}"
  policy = "${data.aws_iam_policy_document.sns_topic_policy.json}"
  depends_on = ["aws_sns_topic.asgevents_alerts"]
}

resource "aws_sns_topic" "asgevents_alerts" {
  name = "asgevents-alerts"
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
depends_on = [aws_sns_topic.asgevents_alerts]
count      = length(var.alarms_email)
  provisioner "local-exec" {
    command = "aws sns subscribe --topic-arn ${aws_sns_topic.asgevents_alerts.arn} --protocol email --notification-endpoint ${element(var.alarms_email, count.index)}"
  }
}

data "aws_iam_policy_document" "sns_topic_policy" {
  policy_id = "__default_policy_ID"

  statement {
    sid = "__default_statement_ID"

    actions = [
      "SNS:Subscribe",
      "SNS:SetTopicAttributes",
      "SNS:RemovePermission",
      "SNS:Receive",
      "SNS:Publish",
      "SNS:ListSubscriptionsByTopic",
      "SNS:GetTopicAttributes",
      "SNS:DeleteTopic",
      "SNS:AddPermission",
    ]

    effect    = "Allow"
    resources = ["${aws_sns_topic.asgevents_alerts.arn}"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceOwner"

      values = [
        "${data.aws_caller_identity.default.account_id}",
      ]
    }
  }

  statement {
    sid       = "Allow CloudwatchEvents"
    actions   = ["sns:Publish"]
    resources = ["${aws_sns_topic.asgevents_alerts.arn}"]

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }
  }

  statement {
    sid       = "Allow asg Event Notification"
    actions   = ["sns:Publish"]
    resources = ["${aws_sns_topic.asgevents_alerts.arn}"]

    principals {
      type        = "Service"
      identifiers = ["autoscaling.amazonaws.com"]
    }
  }
}

