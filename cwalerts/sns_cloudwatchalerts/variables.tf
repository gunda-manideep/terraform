variable "name_prefix" {
  type        = "string"
  description = "CNCT009-Connect_Canada"
}



variable "evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold."
  type        = number
}


variable "topicname" {
  description = "List of SNS Topic ARNs to use for customer notifications."
  type        = list(string)
}

variable "period" {
  description = "The period in seconds over which the specified statistic is applied."
  type        = number
}
variable "NumberOfNotificationsFailedalarmthreshold" {
  description = "The value against which the specified statistic is compared."
  type        = number
}

variable "add_sns_policy" {
    description = "Attach a policy that allows the notifications through to the SNS topic endpoint"
}
variable "emails" {
    type = "list"
}

