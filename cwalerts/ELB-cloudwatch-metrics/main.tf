resource "aws_cloudwatch_metric_alarm" "backend_4xx" {
  alarm_name          = "${var.name_prefix}-ApplicationELB_HTTPCode_Target_4XXCount-${element(var.alb_arn_suffix,count.index)}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  count               = length(var.alb_arn_suffix)
  metric_name         = "HTTPCode_Target_4XX_Count"
  namespace           = "AWS/ApplicationELB"
  treat_missing_data = "notBreaching"

  dimensions = {
    LoadBalancer = "${element(var.alb_arn_suffix,count.index)}"
  }

  statistic         = "Average"
  period            = var.period
  threshold         = "${var.threshold_backend_4xx}"
  alarm_description = "The number of HTTP response codes generated by the targets exceeded ${var.threshold_backend_4xx} in 60s. This does not include any response codes generated by the load balancer. "
  alarm_actions     = ["${aws_sns_topic.elb_alarms.arn}"]
  ok_actions     = ["${aws_sns_topic.elb_alarms.arn}"]
}


resource "aws_cloudwatch_metric_alarm" "backend_5xx" {
  alarm_name          = "${var.name_prefix}-ApplicationELB_HTTPCode_Target_5XXCount-${element(var.alb_arn_suffix,count.index)}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  count               = length(var.alb_arn_suffix)
  metric_name         = "HTTPCode_Target_5XX_Count"
  namespace           = "AWS/ApplicationELB"
  treat_missing_data = "notBreaching"

  dimensions = {
    LoadBalancer = "${element(var.alb_arn_suffix,count.index)}"
  }

  statistic         = "Average"
  period            = var.period
  threshold         = "${var.threshold_backend_5xx}"
  alarm_description = "The number of HTTP response codes generated by the targets exceeded ${var.threshold_backend_5xx} in 60s. This does not include any response codes generated by the load balancer. "
  alarm_actions     = ["${aws_sns_topic.elb_alarms.arn}"]
  ok_actions     = ["${aws_sns_topic.elb_alarms.arn}"]
}


resource "aws_cloudwatch_metric_alarm" "Target_response_time" {
  alarm_name          = "${var.name_prefix}-ApplicationELB_TargetResponseTimes-${element(var.alb_arn_suffix,count.index)}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  count               = length(var.alb_arn_suffix)
  metric_name         = "TargetResponseTime"
  namespace           = "AWS/ApplicationELB"
  treat_missing_data = "notBreaching"

  dimensions = {
    LoadBalancer = "${element(var.alb_arn_suffix,count.index)}"
  }

  statistic         = "Average"
  period            = var.period
  threshold         = "${var.threshold_high_latency}"
  alarm_description = "The time elapsed, in seconds, after the request leaves the load balancer until a response from the target is received has exceeded an average of ${var.threshold_high_latency}s."
  alarm_actions     = ["${aws_sns_topic.elb_alarms.arn}"]
  ok_actions     = ["${aws_sns_topic.elb_alarms.arn}"]
}



resource "aws_cloudwatch_metric_alarm" "unhealthy_hosts" {
  alarm_name          = "${var.name_prefix}-ApplicationELB_UnHealthyHosts-${element(var.alb_arn_suffix,count.index)}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  count               = length(var.alb_arn_suffix)
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  treat_missing_data = "notBreaching"

  dimensions = {
    LoadBalancer = "${element(var.alb_arn_suffix,count.index)}"
  }

  statistic         = "Average"
  period            = var.period
  threshold         = "${var.threshold_unhealthy_host_count}"
  alarm_description = "The number of targets that are considered unhealthy exceeded ${var.threshold_unhealthy_host_count}."
  alarm_actions     = ["${aws_sns_topic.elb_alarms.arn}"]
  ok_actions     = ["${aws_sns_topic.elb_alarms.arn}"]
}


resource "aws_cloudwatch_metric_alarm" "alb_5xx" {
  alarm_name          = "${var.name_prefix}-ApplicationELB_HTTPCode_ELB_5XXCount-${element(var.alb_arn_suffix,count.index)}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  count               = length(var.alb_arn_suffix)
  metric_name         = "HTTPCode_ELB_5XX_count"
  namespace           = "AWS/ApplicationELB"
  treat_missing_data = "notBreaching"

  dimensions = {
    LoadBalancer = "${element(var.alb_arn_suffix,count.index)}"
  }

  statistic         = "Average"
  period            = var.period
  threshold         = "${var.threshold_elb_5xx}"
  alarm_description = "The number of HTTP 5XX server error codes that originate from the exceeded ${var.threshold_elb_5xx} in 60s. This count does not include any response codes generated by the targets. "
  alarm_actions     = ["${aws_sns_topic.elb_alarms.arn}"]
  ok_actions     = ["${aws_sns_topic.elb_alarms.arn}"]
}

resource "aws_cloudwatch_metric_alarm" "alb_4xx" {
  alarm_name          = "${var.name_prefix}-ApplicationELB_HTTPCode_ELB_4XXCount-${element(var.alb_arn_suffix,count.index)}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  count               = length(var.alb_arn_suffix)
  metric_name         = "HTTPCode_ELB_4XX_count"
  namespace           = "AWS/ApplicationELB"
  treat_missing_data = "notBreaching"

  dimensions = {
    LoadBalancer = "${element(var.alb_arn_suffix,count.index)}"
  }

  statistic         = "Average"
  period            = var.period
  threshold         = "${var.threshold_elb_4xx}"
  alarm_description = "The number of HTTP 4XX server error codes that originate from the exceeded ${var.threshold_elb_4xx} in 60s. This count does not include any response codes generated by the targets. "
  alarm_actions     = ["${aws_sns_topic.elb_alarms.arn}"]
  ok_actions     = ["${aws_sns_topic.elb_alarms.arn}"]
}


resource "aws_cloudwatch_metric_alarm" "healthy_hosts" {
  alarm_name          = "${var.name_prefix}-ApplicationELB_HealthyHostCount-${element(var.alb_arn_suffix,count.index)}"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = var.evaluation_periods
 count               = length(var.alb_arn_suffix)
  metric_name         = "HealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  treat_missing_data = "notBreaching"

  dimensions = {
    LoadBalancer = "${element(var.alb_arn_suffix,count.index)}"
  }

  statistic         = "Average"
  period            = var.period
  threshold         = "${var.threshold_unhealthy_host_count}"
  alarm_description = "The number of targets that are considered unhealthy exceeded ${var.threshold_unhealthy_host_count}."
  alarm_actions     = ["${aws_sns_topic.elb_alarms.arn}"]
  ok_actions     = ["${aws_sns_topic.elb_alarms.arn}"]
}
resource "aws_cloudwatch_metric_alarm" "ActiveConnectionCount" {
  alarm_name          = "${var.name_prefix}-ApplicationELB_ActiveConnectionCount-${element(var.alb_arn_suffix,count.index)}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  count               = length(var.alb_arn_suffix)
  metric_name         = "ActiveConnectionCount"
  namespace           = "AWS/ApplicationELB"
  treat_missing_data = "notBreaching"

  dimensions = {
    LoadBalancer = "${element(var.alb_arn_suffix,count.index)}"
  }

  statistic         = "Average"
  period            = var.period
  threshold         = "${var.threshold_active_connection_count}"
  alarm_description = "The number of targets that are considered unhealthy exceeded ${var.threshold_active_connection_count}."
  alarm_actions     = ["${aws_sns_topic.elb_alarms.arn}"]
  ok_actions     = ["${aws_sns_topic.elb_alarms.arn}"]
}


resource "aws_cloudwatch_metric_alarm" "target_connection_error_Count" {
  alarm_name          = "${var.name_prefix}-ApplicationELB_TargetConnectionErrors-${element(var.alb_arn_suffix,count.index)}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  count               = length(var.alb_arn_suffix)
  metric_name         = "TargetConnectionErrorCount"
  namespace           = "AWS/ApplicationELB"
  treat_missing_data = "notBreaching"

  dimensions = {
    LoadBalancer = "${element(var.alb_arn_suffix,count.index)}"
  }

  statistic         = "Average"
  period            = var.period
  threshold         = "${var.threshold_target_connection_error_count}"
  alarm_description = "${var.threshold_target_connection_error_count} connections were not successfully established between the load balancer and target."
  alarm_actions     = ["${aws_sns_topic.elb_alarms.arn}"]
  ok_actions     = ["${aws_sns_topic.elb_alarms.arn}"]
}

