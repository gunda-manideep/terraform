variable "name_prefix" {
  type        = "string"
  description = "The alarm name prefix."
}
variable "evaluation_periods" {
  type        = number
  description = "Number of periods to evaluate for the alarm"
}
variable "period" {
  type        = number
  description = "Duration in seconds to evaluate for the alarm"
}
variable "threshold_4xx" {
  type         = number
}
variable "threshold_5xx" {
  type         = number
}
variable "threshold_latency" {
  type         = number
}

variable "emails" {
  type = list
}
variable "api_name" {
 type  = list
}
