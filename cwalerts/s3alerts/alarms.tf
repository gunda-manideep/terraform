resource "aws_cloudwatch_metric_alarm" "bucketsizebytes" {
  alarm_name          = "${var.name_prefix}-BucketSizeBytes-${element(var.bucket_name,count.index)}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "BucketSizeBytes"
  count               = length(var.bucket_name)
  namespace           = "AWS/S3"
  period              = var.period
  StorageType         = var.bucketsizebytesstoragetype
  statistic           = "Average"
  threshold           = var.bucketsizebytes_threshold
  alarm_description   = "bucketsizebytes monitoring"
  alarm_actions       = ["${aws_sns_topic.s3_alerts.arn}"]
  ok_actions          = ["${aws_sns_topic.s3_alerts.arn}"]
  treat_missing_data  = "notBreaching"
  dimensions = {
    FunctionName       = "${element(var.bucket_name,count.index)}" 
  }
}
resource "aws_cloudwatch_metric_alarm" "numberofobjects" {
  alarm_name          = "${var.name_prefix}-NumberOfObjects-${element(var.bucket_name,count.index)}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = "NumberOfObjects"
  count               = length(var.bucket_name)
  namespace           = "AWS/S3"
  period              = var.period
  StorageType         = var.numberofobjectsstoragetype
  statistic           = "Average"
  threshold           = var.numberofobjects_threshold
  alarm_description   = "NumberOfObjects monitoring"
  alarm_actions       = ["${aws_sns_topic.s3_alerts.arn}"]
  ok_actions          = ["${aws_sns_topic.s3_alerts.arn}"]
  treat_missing_data  = "notBreaching"
  dimensions = {
    FunctionName       = "${element(var.bucket_name,count.index)}"  
  }
}


