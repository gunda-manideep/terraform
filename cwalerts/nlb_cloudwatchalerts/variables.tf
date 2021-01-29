variable "name_prefix" {
  type        = "string"
  description = "The alarm name prefix."
}



variable "period" {
  description = "The period in seconds over which the specified statistic is applied."
  type        = number
}

variable "statistic" {
  description = "The statistic to apply to the alarm's associated metric. Either of the following is supported: SampleCount, Average, Sum, Minimum, Maximum"
  type        = string
}

variable "threshold" {
  description = "The value against which the specified statistic is compared."
  type        = number
}


variable "targetgroup" {
    type = list
    description = "targetgroupname"
}

variable "networkloadbalancername" {
    type = list
    description = "networkloadbalancername"
}


variable "emails" {
    description = "notificationemailid"
    type = list
}


variable "evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold."
  type        = number
}

