variable "name_prefix" {
  type        = "string"
  description = "The alarm name prefix."
}
variable "evaluation_periods" {
  type        = number
  description = "Number of periods to evaluate for the alarm"
  default     = 1
}
variable "alarm_actions_enabled" {
  type    = bool
  default = true
}
variable "cpu_reservation_high_threshold" {
  type        = number
  description = "The maximum percentage of CPU reservation average"
  default     = 80
}
variable "cpu_reservation_low_threshold" {
  type        = number
  description = "The maximum percentage of CPU utilization average"
  default     = 40
}
variable "cpu_utilization_high_threshold" {
  type        = number
  description = "The maximum percentage of CPU utilization average"
  default     = 80
}
variable "memory_utilization_high_threshold" {
  type        = number
  description = "The maximum percentage of Memory utilization average"
  default     = 80
}
variable "memory_reservation_high_threshold" {
  type        = number
  description = "The maximum percentage of Memory utilization average"
  default     = 80
}
variable "emails" {
  type = list
  default = ["anupama.s@imimobile.com","manideep.g@imimobile.com"]
}
variable "taskcount_threshold" {
  type    = number
  default = 1
}
variable "Service_count_threshold" {
 type    = number
 default = 1
}
variable "task_count_threshold" {
 type = number
 default = 1
}
variable "running_task_count_threshold" {
 type = number
 default = 1
}
variable "period" {
 type = number
 default = 120
}
variable "ecs_cluster_name" {
  type = string
  default = "devopstest"
}
variable "exposedservices" {
  description = "List of Exposable services"
  default = [
    {
      something = "value"
    },
    {
      something = "value"
    },
  ]
}
variable "nonexposedservices" {
  description = "List of Non Exposable services"
  default = [
    {
      something = "value"
    },
    {
      something = "value"
    },
  ]
}

