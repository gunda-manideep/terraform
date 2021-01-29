variable "name_prefix" {
  type        = "string"
  description = "The alarm name prefix."
}
variable "evaluation_periods" {
  type  = number
}
variable "period" {
  type  = number
}
variable "cpu_utilization_threshold" {
  type = number
}
#variable "Disk_read_ops_threshold" {
 # type = number
#}
#variable "Disk_write_ops_threshold" {
#  type = number
#}
#variable "status_check_threshold" {
#  type = number
#}
variable "emails" {
  type = list
}
#variable "instance_read_write_ids" {
# type = list
#}
variable "instance_ids" {
 type  = list
}
