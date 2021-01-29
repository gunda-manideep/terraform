variable "name_prefix" {
  type        = "string"
  description = "The alarm name prefix."
}
#variable "client_connections_threshold" {
# type  = "string"
#}
variable "filesystem_id" {
  description = "The EFS file system ID that you want to monitor"
  type        = list
}
variable "burst_credit_balance_threshold" {
  description = "The minimum number of burst credits that a file system should have."
  type        = "string"
}
variable "percent_io_limit_threshold" {
  description = "IO Limit threshold"
  type        = string
}
variable "evaluation_periods" {
  type        = number
  description = "The evaluation period over which to use when triggering alarms."
}
variable "emails" {
  type = list
}
variable "period" {
 type = number
}
#variable "total_io_threshold"{
 #type = string
#}
variable "permitted_threshold"{
 type = string
}

