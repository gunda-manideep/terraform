variable "name_prefix" {
  type        = "string"
  description = "The alarm name prefix."
}
variable "bucket_name" {
  type        = list
  description = "bucket function name"
}

variable "evaluation_periods"{
  description  = "Number of periods to evaluate for the alarm"
  type         = number
}
variable "period" {
  type         = number
  description  = "Duration in seconds to evaluate for the alarm"
}
variable "bucketsizebytes_threshold" {
  type        = number
}

{
variable "numberofobjects_threshold" {
  type        = number
}

{
variable  "numberofobjectsstoragetype" {
 type        = "string"
}
{

variable "bucketsizebytesstoragetype" {
 type = "string"
}
{
variable "emails" {
  type = list
}
