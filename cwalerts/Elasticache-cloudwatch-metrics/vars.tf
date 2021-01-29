variable "name_prefix" {
  type        = "string"
  description = "The alarm name prefix."
}
variable "cache_cluster_id" {
  type        = list
  description = "The ID of the cache cluster that we want to monitor."
 }
variable "cpuutilization_threshold" {
  type        = "string"
  description = "The value against which the CPUUtilization metric is compared, in percent."
}
#variable "enginecpuutilization_threshold" {
#  type        = "string"
#  description = "The value against which the CPUUtilization metric is compared, in percent."
#}
variable "evaluation_periods" {
  type = number
}
variable "period" {
  type = number
}
#variable "replication_threshold" {
#   type = number
#}
variable "emails" {
  type = list
}
variable "swap_usage_threshold" { 
 type = number
}
