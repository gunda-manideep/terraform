variable "name_prefix" {
  type        = "string"
  description = "The alarm name prefix."
}

variable "volumequeuelength_threshold" {
  type        = number
  description = "The value against which the EBS VolumeQueueLength metric is compared."
}
variable "volume_id" {
  type        = list
  description = "The ID of the EBS volume that we want to monitor."
 }
variable "evaluation_periods" {
 type   = number
}
variable "period" {
   type = number
}
variable "emails" {
  type = list
}
variable "burst_balance_threshold" {
  description = "The minimum number of burst credits that a file system should have."
  type        = number
}
variable "iopsthreshold"{
   type = number 
}
variable "datapoints_to_alarm" {
 type   = number
}
