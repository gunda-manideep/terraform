variable "name_prefix" {
  type        = "string"
  description = "The alarm name prefix."
}

variable "dbinstanceids" {
  type = list
  description = "The instance ID of the RDS database instance that you want to monitor."
}
#variable "burst_balance_threshold" {
#  description = "The minimum percent of General Purpose SSD (gp2) burst-bucket I/O credits available."
#  type        = number
#}


#variable "cpu_credit_balance_threshold" {
 # description = "The minimum number of CPU credits (t2 instances only) available."
 # type        = number
#}

#variable "disk_queue_depth_threshold" {
 # description = "The maximum number of outstanding IOs (read/write requests) waiting to access the disk."
  #type        = number
#}


#variable "swap_usage_threshold" {
#  description = "The maximum amount of swap space used on the DB instance in Byte."
#  type        = "string"

  # 256 Megabyte in Byte
#}

#variable "WriteLatencyThreshold" {
#  description = "The maximum writelatency (t2 instances only) available."
#  type        = number
#}

#variable "WriteIOPSThreshold" {
#  description = "The maximum number of outstanding IOs (write requests) waiting to access the disk."
#  type        = number
#}


#variable "ReadIOPSThreshold" {
#  description = "The maximum number of outstanding IOs (READ requests) waiting to access the disk."
 # type        = "string"

  # 256 Megabyte in Byte
#}


variable "DatabaseConnectionsThreshold" {
  description = "The maximum number of outstanding connections."
  type        = number
}

#variable "BurstBalanceThreshold" {
#  description = "The maximum number of outstanding connections."
#  type        = number
#}


variable "CPUUtilizationThreshold" {
  description = "The maximum number of outstanding cpu utilization."
  type        = number

  # 256 Megabyte in Byte
}
variable "evaluation_periods" {
  type   = number
}
variable "period" {
  type  = number
}



variable "alarms_email" {
    type = list
}
#variable "FreeStorageSpaceThreshold" {
#  description = "The maximum number of outstanding FreeStorageSpace."
#  type        = number
#}
variable "FreeableMemoryThreshold" {
  description = "The maximum number of outstanding FreeableMemory."
  type        = number
}
#variable "BinLogDiskUsageThreshold" {
#  description = "The maximum number of outstanding BinLogDiskUsage."
#  type        = number
#}
variable "DeadlockThreshold" {
type  = number
}
