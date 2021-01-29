output "cluster_failed_node_count_alarm_id" {
  value       = join("", aws_cloudwatch_metric_alarm.cluster_failed_node_count.*.id)
  description = "cluster failed node count metric alarm ID"
}
output "node_cpu_Utilization_id" {
  value       = join("", aws_cloudwatch_metric_alarm.node_cpu_Utilization.*.id)
  description = "Node CPU utilization CloudWatch metric alarm ID"
}
output "node_memory_Utilization_id" {
  value       = join("", aws_cloudwatch_metric_alarm.node_memory_Utilization.*.id)
  description = "Node Memory utilization CloudWatch metric alarm ID"
}
output "pod_cpu_Utilization_id" {
  value       = join("", aws_cloudwatch_metric_alarm.pod_cpu_Utilization.*.id)
  description = "Pod CPU utilization CloudWatch metric alarm ID"
}
output "pod_memory_Utilization_id" {
  value       = join("", aws_cloudwatch_metric_alarm.pod_memory_Utilization.*.id)
  description = "Pod Memory utilization CloudWatch metric alarm ID"
}
output "pod_cpu_Utilization_over_pod_limit_id" {
  value       = join("", aws_cloudwatch_metric_alarm.pod_cpu_Utilization_over_pod_limit.*.id)
  description = "Pod CPU utilization over pod limit CloudWatch metric alarm ID"
}
output "pod_memory_Utilization_over_pod_limit_id" {
  value       = join("", aws_cloudwatch_metric_alarm.pod_memory_Utilization_over_pod_limit.*.id)
  description = "Pod Memory utilization over pod limit CloudWatch metric alarm ID"
}











  
