variable "ecs_cluster_name" {
  description = "AWS ECS Cluster Name"
  type    = list
}

 variable "name_prefix" {
  type        = "string"
  description = "The alarm name prefix."
}

variable "cpu_reservation_high_threshold" {
  type        = number
  description = "The maximum percentage of CPU reservation average"
}
variable "cpu_utilization_high_threshold" {
  type        = number
  description = "The maximum percentage of CPU utilization average"
}
variable "evaluation_periods" {
  type        = number
  description = "Number of periods to evaluate for the alarm"
}
variable "period" {
  type        = number
  description = "Duration in seconds to evaluate for the alarm"
}
variable "memory_utilization_high_threshold" {
  type        = number
  description = "The maximum percentage of Memory utilization average"
}
variable "memory_reservation_high_threshold" {
  type        = number
  description = "The maximum percentage of Memory utilization average"
}
variable "emails" {
  type = list
}
variable "cluster_arn" {
  type = list
}
