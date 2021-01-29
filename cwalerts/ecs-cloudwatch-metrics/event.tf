data "template_file" "event_pattern_stopped" {
  template = file("${path.module}/files/deploy-failed-notification.json")
  count = length(var.ecs_cluster_name)
  vars = {
    cluster_arn = "${element(var.cluster_arn,count.index)}"
  }
}

resource "aws_cloudwatch_event_rule" "test-event-failed" {
  name          = "${element(var.ecs_cluster_name,count.index)}-failed-deploy"
  count = length(var.ecs_cluster_name)
  description   = "Deploy failure notification"
  event_pattern = data.template_file.event_pattern_stopped[count.index].rendered
}

data "template_file" "event_pattern_running" {
  template = file("${path.module}/files/deploy-running-notification.json")
  count = length(var.ecs_cluster_name)
  vars = {
    cluster_arn = "${element(var.cluster_arn,count.index)}"
  }
}

resource "aws_cloudwatch_event_rule" "test-event-running" {
  name          = "${element(var.ecs_cluster_name,count.index)}-running-deploy"
  count = length(var.ecs_cluster_name)
  description   = "Deploy running notification"
  event_pattern = data.template_file.event_pattern_running[count.index].rendered
}

resource "aws_cloudwatch_event_target" "sns-failed" {
  rule      = "${aws_cloudwatch_event_rule.test-event-failed[count.index].name}"
  target_id = "SendToSNS"
  count = length(var.ecs_cluster_name)
  arn       = "${aws_sns_topic.ecs_Alarm.arn}"
}
resource "aws_cloudwatch_event_target" "sns-running" {
  rule      = "${aws_cloudwatch_event_rule.test-event-running[count.index].name}"
  target_id = "SendToSNS"
  count = length(var.ecs_cluster_name)
  arn       = "${aws_sns_topic.ecs_Alarm.arn}"
}


