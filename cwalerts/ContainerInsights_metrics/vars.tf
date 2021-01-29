variable "name_prefix" {
  type        = "string"
  description = "The alarm name prefix."
}
variable "node_name"{
type = "string"
description = "name of the node or namespace of the node"
default = ""
}
variable "evaluation_periods" {
  type        = number
  description = "Number of periods to evaluate for the alarm"
  default     = 1
}
variable "period" {
  type        = number
  description = "Duration in seconds to evaluate for the alarm"
  default     = "300"
}
variable "cluster_failed_node_count_threshold" {
  type        = number
  description = "The number of cluster nodes failed"
  default     = ""
}
variable "node_cpu_utilization_threshold" {
  type        = number
  description = "The maximum percentage of node CPU utilization average"
  default     = ""
}
variable "node_memory_utilization_threshold" {
  type        = number
  description = "The maximum percentage of node Memory utilization average"
  default     = ""
}
variable "pod_cpu_utilization_threshold" {
  type        = number
  description = "The maximum percentage of pod cpu utilization average"
  default     = ""
}
variable "pod_memory_utilization_threshold" {
  type        = number
  description = "The maximum percentage of pod memory utilization average"
  default     = ""
}
variable "pod_cpu_utilization_over_pod_limit_threshold" {
  type        = number
  description = "The maximum percentage of pod cpu utilization over pod limit average"
  default     = ""
}
variable "pod_memory_utilization_over_pod_limit_threshold" {
  type        = number
  description = "The maximum percentage of pod memory utilization over pod limit average"
  default     = ""
}
variable "emails" {
  type = list
  default = ["anupama.s@imimobile.com","manideep.g@imimobile.com"]
}



