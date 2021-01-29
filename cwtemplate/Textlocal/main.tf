provider "aws" {
    region     = "eu-west-2"
}
terraform {
  backend "s3" {
      bucket  = "textlocal-london-cloudwatch-alerts-tfstate"
      key     = "terraform/apptype/cwalerts/london/cwalerts.tfstate"
      region  = "eu-west-2"
      encrypt = true
  }
}
module "elb-alerts" {
  # source the directory path where the elb module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//ELB-cloudwatch-metrics/?ref=textlocal1.0"
  name_prefix              =  "Textlocal"
  evaluation_periods         = 1
  period                    = 300
  emails                   = ["operations@textlocal.com"]
  alb_arn_suffix           =  ["arn:aws:elasticloadbalancing:eu-west-2:340982601645:loadbalancer/app/uk-aws-webALB/2b1a3005670fce81"]
  threshold_backend_5xx    = 20
  threshold_elb_5xx        = 20
  threshold_high_latency   = 10
  threshold_target_connection_error_count = 20
  threshold_unhealthy_host_count  = 1
  threshold_healthy_host_count    = 1
  threshold_backend_4xx           = 20
  threshold_elb_4xx               = 20
  threshold_active_connection_count  = 10
  }
  module "ec2-alerts" {
    # source the directory path where the ec2-alerts module is located.
    source = "git::https://git.imimobile.net/imidevops/cwalerts.git//ec2-cloudwatch-alerts/?ref=textlocal1.0"
    name_prefix              =  "Textlocal"
    evaluation_periods        = 1
    period                    = 300
    cpu_utilization_threshold  = 80
   # Disk_read_ops_threshold    = 80
   # instance_read_write_ids    = ["i-043b0b1acc9ec9f6f","i-0140c119fc306db77","i-0e64b8dffa072a7e1"]
   # Disk_write_ops_threshold   = 80
    instance_ids               = ["i-043b0b1acc9ec9f6f","i-0140c119fc306db77","i-0e64b8dffa072a7e1"]
    emails                   =  ["operations@textlocal.com"]
    }
  module "efs-alerts" {
    # source the directory path where the efs-alerts module is located.
    source = "git::https://git.imimobile.net/imidevops/cwalerts.git//efs-cloudwatch-alerts/?ref=textlocal1.0"
    name_prefix              =  "Textlocal"
    evaluation_periods         = 1
    period                    = 300
    emails                   =  ["operations@textlocal.com"]
#   client_connections_threshold  = "1"
    filesystem_id                 = ["fs-6bf1bf9a"]
    burst_credit_balance_threshold  = "1.54e+12"
    percent_io_limit_threshold      = "0.8"
#    total_io_threshold              = "100000"
    permitted_threshold             = "1.05e+8"
  }
  module "elastiCache-alerts" {
    # source the directory path where the elastiCache module is located.
    source = "git::https://git.imimobile.net/imidevops/cwalerts.git//Elasticache-cloudwatch-metrics/?ref=textlocal1.0"
    name_prefix              =  "Textlocal"
    evaluation_periods         = 1
    period                    = 300
    emails                   =  ["operations@textlocal.com"]
    cache_cluster_id         =  ["uk-aws-memcache","sessions"]
    cpuutilization_threshold = "1"
   #  enginecpuutilization_threshold  = 25
   #  replication_threshold     = 1
    swap_usage_threshold   = "1"
    }
module "nlb-alerts" {
  # source the directory path where the nlb-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//nlb_cloudwatchalerts/?ref=textlocal1.0"
  name_prefix              =  "Textlocal"
  evaluation_periods         = 1
  period                    = 300
  emails                   =  ["operations@textlocal.com"]
  statistic                 =  "Average"
  threshold                 =  1
  targetgroup               =  ["targetgroup/ext-nrpe/631b2dc62ad09b02"]
  networkloadbalancername      = ["tl-aws-temp-nrpe"]
}
module "nlb-alerts-1" {
  # source the directory path where the nlb-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//nlb_cloudwatchalerts/?ref=textlocal1.0"
  name_prefix              =  "Textlocal"
  evaluation_periods         = 1
  period                    = 300
  emails                   =  ["operations@textlocal.com"]
  statistic                 =  "Average"
  threshold                 =  1
  targetgroup               =  ["targetgroup/uk-aws-target-rabbitMQ/82e7468112f06f63"]
  networkloadbalancername      = ["uk-aws-lb-rabbitmq"]
}

    module "rds-alerts" {
  # source the directory path where the rds-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//rds_cloudwatchalerts/?ref=textlocal1.0"
  name_prefix              =  "Textlocal"
  evaluation_periods         = 1
  period                    = 300
  alarms_email                  =  ["operations@textlocal.com"]
  dbinstanceids             =  ["uk-aws-intermediary-instance-1","uk-aws-intermediary-instance-1-eu-west-2a"]
#  burst_balance_threshold    = 20
 # swap_usage_threshold        = "256000000"
#  WriteLatencyThreshold       = 20
#  WriteIOPSThreshold          = 80
#  ReadIOPSThreshold           = 80
  DatabaseConnectionsThreshold  = 20
#  BurstBalanceThreshold        = 95
  CPUUtilizationThreshold      = 80
 # FreeStorageSpaceThreshold    = 92160
  FreeableMemoryThreshold      = "5e+10"
 # BinLogDiskUsageThreshold     = 1024
   DeadlockThreshold            = 0
  }
  module "vpn-alerts" {
    # source the directory path where the vpn alerts module is located.
    source = "git::https://git.imimobile.net/imidevops/cwalerts.git//vpn_cloudwatchalerts/?ref=textlocal1.0"
    name_prefix              =  "Textlocal"
    evaluation_periods         = 1
    period                    = 300
    statistic                =  "Average"
    comparison_operator      =  "LessThanThreshold"
    alarms_email              =  ["operations@textlocal.com"]
    add_sns_policy             = "false"
    TunnelStatethreshold        = 0.5
    vpnid                       = ["vpn-0145039fdfa9602c8","vpn-09cb19bdc7b0fbbd1"]
    }
module "ebs-alerts" {
    # source the directory path where the ebs-alerts module is located.
    source = "git::https://git.imimobile.net/imidevops/cwalerts.git//EBS-cloudwatch-metrics/?ref=textlocal1.0"
    name_prefix              =  "Textlocal"
    volumequeuelength_threshold = 10
    volume_id                =  ["vol-04a3c6a93496a82c3","vol-065353cf68b889246","vol-0a9ebbb977837d0a1"]
    evaluation_periods         = 1
    iopsthreshold              = 4000
    period                    = 300
    burst_balance_threshold   = 95
    emails                   =  ["operations@textlocal.com"]
    datapoints_to_alarm    = 1
    }

