variable "name_prefix" {
  type        = "string"
  description = "The alarm name prefix."
}
variable "evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold."
  type        = number
}
variable "period" {
  description = "The period in seconds over which the specified statistic is applied."
  type        = number
}

variable "statistic" {
  description = "The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum"
  type        = string
}


variable "add_sns_policy" {
    description = "Attach a policy that allows the notifications through to the SNS topic endpoint"
    type = "string"
}
variable "TunnelStatethreshold" {
  description = "The value against which the specified statistic is compared."
  type        = string
}
variable "vpnid" {
  type = list
}
variable "alarms_email"{
 type  = list 
}

variable "comparison_operator"{
  type = "string"
}

