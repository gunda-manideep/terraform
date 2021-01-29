variable "name_prefix" {
  type        = "string"
  description = "The alarm name prefix."
}
variable "alb_arn_suffix" {
  description = "Specify the load balancer as follows: app/load-balancer-name/1234567890123456 (the final portion of the load balancer ARN)."
  type = list
}
variable "threshold_backend_5xx" {
   type = number
}
variable "threshold_elb_5xx" {
   type = number
}
variable "threshold_high_latency" {
   type = number
}
variable "threshold_target_connection_error_count" {
   type = number
}
variable "threshold_unhealthy_host_count" {
   type = number
}
variable "threshold_healthy_host_count" {
    type = number
}
variable "threshold_backend_4xx" {
   type = number
}
variable "threshold_elb_4xx" {
    type = number
}
variable "threshold_active_connection_count" {
    type = number
}
variable "emails" {
  type = list
}
variable "evaluation_periods" {
  type = number
}
variable "period" {
 type = number
}
