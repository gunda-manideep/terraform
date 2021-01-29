variable "name_prefix" {
  type        = "string"
  description = "The alarm name prefix."
}
variable "alarm_description" {
  description = "The description for the alarm."
  type        = string
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
variable "AccountProvisionedWriteCapacityUtilizationthreshold" {
  description = "The value against which the specified statistic is compared."
  type        = string
}
variable "MaxProvisionedTableReadCapacityUtilizationthreshold" {
  description = "The value against which the specified statistic is compared."
  type        = string
}
variable "MaxProvisionedTableWriteCapacityUtilizationthreshold" {
  description = "The value against which the specified statistic is compared."
  type        = string
}
variable "AccountProvisionedReadCapacityUtilizationthreshold" {
  description = "The value against which the specified statistic is compared."
  type        = string
}
variable "alarms_email" {
    type = list
}
#variable "tablename" {
#  type = "list"
#  description = "The tablename of the dynamo database that you want to monitor."
#}

