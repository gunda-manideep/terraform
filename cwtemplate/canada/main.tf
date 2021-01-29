provider "aws" {
    region     = "ca-central-1"
}

terraform {
  backend "s3" {
      bucket  = "imiconnect-cloudwatch-alerts-tfstate"
      key     = "terraform/apptype/cwalerts/canada/cwalerts.tfstate"
      region  = "ca-central-1"
  }
}

module "apigateway-alerts" {
  # source the directory path where the apigateway-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//Apigateway-metrics/?ref=Alerts1.0"
  name_prefix              =  "CNCT009-Connect_Canada"
  evaluation_periods       =  1
  period                   =  300
  threshold_4xx            =  80
  threshold_5xx            =  80
  threshold_latency        =  10000
  emails                   =  ["tivolimonitor@imimobile.com"]
  api_name                 =  ["imi-whatsapp-as-canada"]
  }


module "ebs-alerts" {
  # source the directory path where the ebs-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//EBS-cloudwatch-metrics/?ref=Alerts1.0"
  name_prefix              =  "CNCT009-Connect_Canada"
  volumequeuelength_threshold = 5000
  volume_id                =  ["vol-0b8b81abb72f52139","vol-05703f704f84bdd49","vol-0e4e0f374f3cfa5ba","vol-0ec1618eebdbd0b03","vol-02525e06687da3217","vol-058c5521c7f89031b","vol-0680a2aeaf48f8e21","vol-0a3ebcb3a07fbda31","vol-07735dbe243145e58","vol-09d1d5e65fbbe0677","vol-07316255d1ff10171","vol-08b29be806792df5e","vol-02a3884da562d3c33","vol-0d4b842602089a90f","vol-09262b7a1aecdc6da","vol-0c1d5f2a85b834a3c","vol-088c74a0eff0b48e5","vol-06f679371f1846c2c","vol-079ef1cf33e690e74","vol-01b9a066badd5c489","vol-0ddbbf6b332e51be6","vol-04a6ecdc3cbcaf09b","vol-0a02619d336b762b3","vol-03ef43321f86eda5c","vol-06faf652a8db7e7a5","vol-0744055cf688afbb2","vol-09474091ba8fc1453","vol-07069471695ebd043","vol-07f80624247585a36","vol-0cccf89bb8c4b359c","vol-05041512888c1d324","vol-0236b37bb4d8c0f2d","vol-0f2b0489dd2265f93","vol-0ec216e15942c1b3f","vol-0d205df0c4f363a7f","vol-085a4c795c2d0ce94","vol-0f98c3c381ef64e3a","vol-0334e049980b68f71","vol-011d4df9293d15758","vol-0998882012b8b8f16","vol-062676d7da2c5935c","vol-0221a843b462d806a","vol-04b8382b9b6d8d2e6","vol-030c215a661a1589a","vol-0b1cba0a737655e2d","vol-09f05ae5f617cda87","vol-01b84e1a0e6956698","vol-0d4e0149a0012bda0","vol-035ef69db83ce6e38","vol-0c35afd9b1c85e6a2","vol-003489b3999e2dd1f","vol-08571ee3d3712c01d","vol-0be3d0b6b9807dad2","vol-0ec5017a8ddad0480","vol-0db126164e5871c1f","vol-01478bc58fabad378","vol-068116512cd8aca1c","vol-0e3949b748639d4aa","vol-009988aae934f9f78","vol-04041c11b6f0a3df0","vol-0f344e9a1b48d4f46","vol-0fbf3fa164a6d4e85","vol-0f09db48a55f29e81","vol-03b098ff80767ca93","vol-0b45feabfc2f4229f","vol-099477d5b44efac7d","vol-0f644c98c203a3417","vol-0fb24acd51cbd1e44","vol-0103b7a017055c20b","vol-0d19105aabe3b7ddf","vol-0231d568b81623a03","vol-0a9a52442e3686b3c","vol-0c0a60f27d4c48f98","vol-0037e5bb38c2e5bc4","vol-084a84c55c3a76886","vol-04997c0fcfa34e894","vol-0db0417cec93502bc","vol-0352e9656c0ebbde9","vol-0fb0fb99ad64186d7","vol-0ba635bc641c6fcf7","vol-0ea0bf27e87544526","vol-038bd91447222b0ed","vol-0ed6302cf0402068b","vol-02cef833076cfa9ce","vol-07e6de54cecc8ec37","vol-0ae46f735866c15c5","vol-036b86e75507ae711","vol-0b4a8d0deee8e7bef","vol-0d94b578ee21a03eb","vol-0d16e5ce58f645f34","vol-094ad13015bba99a9","vol-074350ce8d1e9a856","vol-06c755269b01de55c","vol-028d938d3b585e801","vol-013d279f15d1a09c0","vol-0d851c0a4f3002f5a","vol-05636f27808cff016","vol-07d79f45523b53187","vol-01a70edfc889fbfde","vol-0374064b42e74ee3f","vol-0be29276a40a09abb","vol-0c84d7f7a731a7dd5","vol-0627356a826c66e79","vol-0741299f83372180c","vol-0a62364792897a21b"]
  iopsthreshold            = 5000
  evaluation_periods         = 1
  period                    = 300
  burst_balance_threshold   = 95
  emails                   =  ["tivolimonitor@imimobile.com"]
  }


module "ec2-alerts" {
  # source the directory path where the ec2-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//ec2-cloudwatch-alerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT009-Connect_Canada"
  evaluation_periods        = 1
  Disk_write_ops_threshold  = 80
  period                    = 300
  cpu_utilization_threshold  = 80
  Disk_read_ops_threshold    = 80
  instance_read_write_ids    = ["i-098d86408bf0ac936"]
 # status_check_threshold     = 1
  instance_ids               =  ["i-00d06c7b4bca7bc6b","i-020cf6a10e93096ab","i-023410b939c091f4b","i-02c377221eab9d4e9","i-02f870513513cae86","i-03ae805ebd16baa9c","i-03bc71cf8e4665beb","i-0479298269f75e987","i-04ab660ed9662e933","i-058eb3cee496499cb","i-05b43b046258065ff","i-063c588150be5b35f","i-0675e494165c3d634","i-06e562a7af8f5c65d","i-06f8b9087b6d5b915","i-0718cb6366106505b","i-071ccd653f1ba5ab1","i-07209880a17cfca22","i-072d03784a009af03", "i-077fcba28bd90210b","i-07c8b673ea666fac7","i-07e7c15f6316aeacd","i-0800f85d468fb4d50","i-085cb0e06c6517c47","i-08b0d5206a77672c9","i-098bdd4423641a756","i-098d86408bf0ac936","i-0a1f8a4be7e7311c9","i-0a80fa6ac79041bea","i-0a83807597b71a49b","i-0bd0a59f4acb26a67","i-0bdfc4ea1c06da48b","i-0c05038a08d6ee309","i-0c4725aecc6587ade","i-0c53799f250757354","i-0c63a7f327761049f","i-0caf81c5d4a07e5ae","i-0cc78dc33f3c0e615","i-0cd2d59023e3981a0","i-0cd37d7f321afcc49","i-0ceca8a95f86c8a34","i-0cf1627f85239d932","i-0d9b2603a2092a91c","i-0dd75ace52b22ccaf","i-0f1fcf2710d4893fe","i-0f2f47e5fe73eb5b9","i-0f53c74c7df6fd4d8","i-0f664c0cd4f62ed9e","i-0fa057590924ec084","i-0fa61a6318be22489","i-0fa62d789bb042296"]
  emails                   =  ["tivolimonitor@imimobile.com"]
  }


module "ecs-alerts" {
  # source the directory path where the ecs-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//ecs-cloudwatch-metrics/?ref=Alerts1.0"
  name_prefix              =  "CNCT009-Connect_Canada"
  evaluation_periods         = 1
  period                    = 300
  emails                   =  ["anupama.s@imimobile.com"]
  ecs_cluster_name          =  ["WhatsappMainCluster","gateway","sfe","ui","core"]
  cpu_reservation_high_threshold = 80
  cpu_utilization_high_threshold  = 80 
  memory_utilization_high_threshold = 80
  memory_reservation_high_threshold  = 95
  cluster_arn                      = ["arn:aws:ecs:ca-central-1:107580227184:cluster/core","arn:aws:ecs:ca-central-1:107580227184:cluster/gateway","arn:aws:ecs:ca-central-1:107580227184:cluster/sfe","arn:aws:ecs:ca-central-1:107580227184:cluster/ui","arn:aws:ecs:ca-central-1:107580227184:cluster/WhatsappMainCluster"]
}

module "efs-alerts" {
  # source the directory path where the efs-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//efs-cloudwatch-alerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT009-Connect_Canada"
  evaluation_periods         = 1
  period                    = 300
  emails                   =  ["tivolimonitor@imimobile.com"]
  client_connections_threshold  = "1.04"
  filesystem_id                 = ["fs-0a42c1e7"]
  burst_credit_balance_threshold  = "2.29e+12"
  percent_io_limit_threshold      = "1.05e+8"
  total_io_threshold              = "1.05e+8"
  permitted_threshold             = "1.05e+8"
  }

module "efs-alerts-fs" {
  # source the directory path where the efs-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//efs-cloudwatch-alerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT009-Connect_Canada"
  evaluation_periods         = 1
  period                    = 300
  emails                   =  ["tivolimonitor@imimobile.com"]
  client_connections_threshold  = "1.04"
  filesystem_id                 = ["fs-7029c89d"]
  burst_credit_balance_threshold  = "1.02e+13"
  percent_io_limit_threshold      = "1.05e+8"
  total_io_threshold              = "4348000"
  permitted_threshold             = "582687736"
  }

  module "elastiCache-alerts" {
  # source the directory path where the elastiCache module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//Elasticache-cloudwatch-metrics/?ref=Alerts1.0"
  name_prefix              =  "CNCT009-Connect_Canada"
  evaluation_periods         = 1
  period                    = 300
  emails                   =  ["tivolimonitor@imimobile.com"]
  cache_cluster_id         =  ["imiconnect-redis-001"]
  cpuutilization_threshold = 80
  enginecpuutilization_threshold  = 80
  replication_threshold     = 80
  swap_usage_threshold   = 80
  }

  module "elb-alerts" {
  # source the directory path where the elb module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//ELB-cloudwatch-metrics/?ref=Alerts1.0"
  name_prefix              =  "CNCT009-Connect_Canada"
  evaluation_periods         = 1
  period                    = 300
  emails                   =  ["tivolimonitor@imimobile.com"]
  alb_arn_suffix           =  ["arn:aws:elasticloadbalancing:ca-central-1:107580227184:loadbalancer/app/admincosole/c0b3ebde99679cee","arn:aws:elasticloadbalancing:ca-central-1:107580227184:loadbalancer/app/DVP-ELB/632382c0bbf12648","arn:aws:elasticloadbalancing:ca-central-1:107580227184:loadbalancer/app/ecs-internal/1d5f34de96f2cffb","arn:aws:elasticloadbalancing:ca-central-1:107580227184:loadbalancer/app/public-api/7ca39b59026d7d15","arn:aws:elasticloadbalancing:ca-central-1:107580227184:loadbalancer/app/star/d050d460900c920f","arn:aws:elasticloadbalancing:ca-central-1:107580227184:loadbalancer/app/star-local-http/3460578b694fdc44","arn:aws:elasticloadbalancing:ca-central-1:107580227184:loadbalancer/app/whats-Whats-AX7H5B23YCPQ/69388d9d718a3325","arn:aws:elasticloadbalancing:ca-central-1:107580227184:loadbalancer/app/whats-Whats-KVJ7X87SPKKT/68b7bfc2a5cf0b5d","arn:aws:elasticloadbalancing:ca-central-1:107580227184:loadbalancer/app/whats-Whats-P3S885XI5S4Q/1ae644d967c9948a"]
  threshold_backend_5xx    = 15
  threshold_elb_5xx        = 15
  threshold_high_latency   = 30
  threshold_target_connection_error_count = 15
  threshold_unhealthy_host_count  = 1
  threshold_healthy_host_count    = 2
  threshold_backend_4xx           = 15
  threshold_elb_4xx               = 15
  threshold_active_connection_count  = 45
  }

  module "lambda-alerts" {
  # source the directory path where the lambda module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//lambda-alerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT009-Connect_Canada"
  evaluation_periods         = 1
  period                    = 300
  emails                   =  ["tivolimonitor@imimobile.com"]
  function_name            =  ["drainer-sfe","drainer-gateway","drainer-core","drainer-ui","imi-whatsapp-as-canada"]
  errors_threshold          = 1
  }

  module "dynamodb-alerts" {
  # source the directory path where the dynamodb-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//dynamodb-cloudwatchalerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT009-Connect_Canada"
  evaluation_periods         = 1
  period                    = 300
  alarms_email               =  ["tivolimonitor@imimobile.com"]
  statistic                =  "Average"
  alarm_description        = "dynamoalarm"
  AccountProvisionedWriteCapacityUtilizationthreshold  = "0.08"
  MaxProvisionedTableReadCapacityUtilizationthreshold  = "0.01"
  MaxProvisionedTableWriteCapacityUtilizationthreshold  = "0.01"
  AccountProvisionedReadCapacityUtilizationthreshold    = "0.08"
}


module "nlb-alerts" {
  # source the directory path where the nlb-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//nlb_cloudwatchalerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT009-Connect_Canada"
  evaluation_periods         = 1
  period                    = 300
  emails                   =  ["tivolimonitor@imimobile.com"]
  statistic                 =  "Average"
  threshold                 =  1
  targetgroup               =  ["targetgroup/DVP-NLB-2121/e6b815c154dfa624","targetgroup/DVP-NLB-7071/a816a69f300730be","targetgroup/DVP-NLB-7777/3a9024dfffff93fa","targetgroup/DVP-NLB-9088/b2a226082425f06b"]
networkloadbalancername      = ["net/DVP-INT-NLB/fcc4fe77d510e481"]
}

module "moscanlb-alerts" {
  # source the directory path where the moscanlb module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//nlb_cloudwatchalerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT009-Connect_Canada"
  evaluation_periods         = 1
  period                    = 300
  emails                   =  ["tivolimonitor@imimobile.com"]
  statistic                 =  "Average"
  threshold                 =  1
  targetgroup               =  ["targetgroup/mosca-8884/034bbacf1bbeffc7","targetgroup/mosca-1884/e45a6955517f6b5a","targetgroup/mosca-8883/24841a080282f400","targetgroup/mosca-1883/3734cef5900b0682"]
networkloadbalancername      = ["net/mosca-nlb/67b62d542a833ea8"]
}


module "rds-alerts" {
  # source the directory path where the rds-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//rds_cloudwatchalerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT009-Connect_Canada"
  evaluation_periods         = 1
  period                    = 300
  alarms_email                  =  ["tivolimonitor@imimobile.com"]
  dbinstanceids             =  ["config-db"]
  burst_balance_threshold    = 20
  cpu_credit_balance_threshold =20
  disk_queue_depth_threshold  = 80
  swap_usage_threshold        = "256000000"
  WriteLatencyThreshold       = 20
  WriteIOPSThreshold          = 400
  ReadIOPSThreshold           = 80
  DatabaseConnectionsThreshold  = 800
  BurstBalanceThreshold        = 80
  CPUUtilizationThreshold      = 80
  }

module "sns-alerts" {
  # source the directory path where the sns module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//sns_cloudwatchalerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT009-Connect_Canada"
  evaluation_periods         = 1
  period                    = 300
  emails                   =  ["tivolimonitor@imimobile.com"]
  topicname                =  ["Connect-IMIconnect-CNCT-CANADA-RDS-CONFIGDB-AWSPROD-MYSQL-CPU-UTILIZATION","Connect-IMIconnect-CNCT-EU-AWSPROD-MYSQLT-RDS-CPU-UTILIZATION-INSUFFICIENT","Connect-IMIconnect-CNCT-EU-AWSPROD-MYSQLT-RDS-CPU-UTILIZATION-WARNING","Elasticcache_alerts","RDS-NOTIFICATIONS","asg-drainer-core","asg-drainer-gateway","asg-drainer-sfe","asg-drainer-ui","dynamodb","dynamodb-alerts","ebs_alerts","ec2_alerts","ecs_alarm","efs-threshold-alerts20200706163444102200000001","efs_alarms","elb_alarms","gateway_alarms","lambda-Errors-alerts","networklb-alerts","rds-alerts","testdynamo","vpn-alerts"]
  NumberOfNotificationsFailedalarmthreshold   = 1
  add_sns_policy             = "false"
  }

module "vpn-alerts" {
  # source the directory path where the vpn alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//vpn_cloudwatchalerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT009-Connect_Canada"
  evaluation_periods         = 1
  period                    = 300
  alarms_email              =  ["tivolimonitor@imimobile.com"]
  statistic                =  "Average"
  add_sns_policy             = "false"
 comparison_operator         = "LessThanThreshold"
  TunnelStatethreshold        = 1
  vpnid                       = ["vpn-089106bd7dd600cf9"]
  }













 

