variable "name_prefix" {
  type        = "string"
  description = "The alarm name prefix."
}
variable "function_name" {
  type        = list
  description = "Lambda function name"
}

variable "evaluation_periods"{
  description  = "Number of periods to evaluate for the alarm"
  type         = number
}
variable "period" {
  type         = number
  description  = "Duration in seconds to evaluate for the alarm"
}
variable "emails" {
  type = list
}
variable "duration_threshold" {
  type = number
}

