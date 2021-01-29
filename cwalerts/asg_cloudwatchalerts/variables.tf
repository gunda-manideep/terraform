variable "groupnames" {
  description = "List of ASG groups to use for customer notifications."
  type        = list(string)
  default     = ["EC2ContainerService-testcluster-EcsInstanceAsg-1F04SUMYH0DRJ","sarathtest-02020020307444384200000000e"]
}
variable "notifications" {
  description = "List of asg actions."
  type        = list(string)
  default     = ["autoscaling:EC2_INSTANCE_LAUNCH","autoscaling:EC2_INSTANCE_TERMINATE","autoscaling:EC2_INSTANCE_LAUNCH_ERROR","autoscaling:EC2_INSTANCE_TERMINATE_ERROR",]
}
variable "alarms_email" {
    type  = list 
    default = ["manideep.g@imimobile.com","anupama.s@imimobile.com"]
}
variable "alarm_name" {
  description = " The descriptive name for the alarm. This name must be unique within the user's AWS account. [**Deprecated** in favor of `name`]. It will be removed in future releases. `name` supercedes the `alarm_name`. Either `name` or `alarm_name` **must** contain a non-default value."
  type        = string
  default     = ""
}
variable "name" {
  description = "The descriptive name for the alarm. This name must be unique within the user's AWS account. `name` supercedes the deprecated `alarm_name`. Either `name` or `alarm_name` **must** contain a non-default value."
  type        = string
  default     = ""
}
variable "sns_topic_arn" {
   description = "An SNS topic ARN that has already been created. Its policy must already allow access from CloudWatch Alarms, or set `add_sns_policy` to `true`"
   default = ""
   type = "string"
}

