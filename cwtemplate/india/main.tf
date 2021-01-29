provider "aws" {
    region     = "ap-south-1"
}

terraform {
  backend "s3" {
      bucket  = "imiconnect-india-cloudwatch-alerts-tfstate"
      key     = "terraform/apptype/cwalerts/india/cwalerts.tfstate"
      region  = "ap-south-1"
      encrypt = true
  }
}

module "apigateway-alerts" {
  # source the directory path where the apigateway-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//Apigateway-metrics/?ref=Alerts1.0"
  name_prefix              =  "CNCT007-Connect_Mumbai"
  evaluation_periods       =  1
  period                   =  300
  threshold_4xx            =  10
  threshold_5xx            =  10
  threshold_latency        =  800
  emails                   =  ["tivolimonitor@imimobile.com"]
  api_name                 =  ["DynamoDB_getItem-API","DynamoDB_putItem-API","imi-whatsapp-as-mumbai"]
  }


module "ebs-alerts" {
  # source the directory path where the ebs-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//EBS-cloudwatch-metrics/?ref=Alerts1.0"
  name_prefix              =  "CNCT007-Connect_Mumbai"
  volumequeuelength_threshold = 1.34
  volume_id     = ["vol-078ed5d8e8891744c","vol-0a0025556d54054af","vol-0f1cdc798a869f954","vol-0fe9390a328045ec6","vol-00714befda709a7f6","vol-063cac7c5ca5bc2b4","vol-09937d13a2bf9e94c","vol-0146555c3cffc06c9","vol-04e9eb5bb39530125","vol-0fe3eaf5eb37c9754","vol-08268340ff5734a64","vol-09555eeaa71533437","vol-08a2c36b297a0fd50","vol-0c7aa859b854425a2","vol-0971057e1ede083ed","vol-0f74af733baabbf04","vol-0da63e1277e0383b8","vol-031975f01bac7ad18","vol-03e16f47561a27cda","vol-0a7d0876678bb9d6c","vol-0df6d9eee1cf5708c","vol-05fd84095eacfda5b","vol-04e02f0d85035863d","vol-0b60c57db5a2d6399","vol-03fe47a9a98bcca23","vol-0251f73b8bf9226f3","vol-05def1b26226c910c","vol-00939bbcb6f20b1a4","vol-0d870d6637c38778f","vol-0f3bcef699d865d94","vol-0f937d6968917b2f1","vol-00c26b1b9f987b142","vol-0831ce5c31f68340e","vol-0f4ccbe0541f83e2a","vol-06a452f098b94f927","vol-0ae28888978ea2919","vol-0d78fd23e5a1faa1a","vol-0ce0675152974ee5d","vol-0995617b112e86c03","vol-0915424e86245ccdd","vol-00c01dee0006632a5","vol-0fb5649a145150807","vol-0a7a273258cfa92e7","vol-00f820e5e0e966ffc","vol-0e5330dfd09ca1c5f","vol-028d9df7391272d42","vol-06aa4150160a28a4b","vol-059058b7b57796740","vol-0162062b02d75c9fb","vol-05ee33074375b5ffb","vol-03bb5ab863cff5a1c","vol-0ebb046d5cffaf939","vol-0a3098220427aa2fe","vol-0ad7b4015a641ca10","vol-0638e8878b76944ef","vol-03ce48cde1ad2c4b6","vol-07303a234df545be3","vol-082cad522227f7f4a","vol-090c8fd2654912807","vol-0c0d7120a2add7dc6","vol-0df16d8fee5692e90","vol-0973e62736fb4bd0e","vol-08f000997650edb1a","vol-0dd03df84cda33358","vol-09e8804755390a430","vol-0321b8dd06a952eb2","vol-0fc56f8de2975050a","vol-0d2d2d621074a1502","vol-0da3ecc98240199d7","vol-047091f4388eddfde","vol-0d1ab1e50a3d3ceb2","vol-0bb6768f1bb694762","vol-0ddcdb3916dfa8c6a","vol-0b9667e439b622279","vol-0e971056452a721f1","vol-08c772289ec541b18","vol-09051739dc33c26ec","vol-0f6cc45a0f00c36f2","vol-0bd91507c91decff6","vol-047ad191ef951331a","vol-0f3979b0a2881133c","vol-05615615fecb15dbe","vol-0663e48b64b0196aa","vol-0d0481cd7b4b28e1b","vol-07a5b8ea537d29114","vol-0079495c5c1657bb2","vol-0e94b9019e6d9c39c","vol-0a73fd8e68527d536","vol-04a39284b5b65a864","vol-098c2cb80bdab2183","vol-0431503299d553499","vol-0fc92b681cbb363f5","vol-016657a7bbc267f99","vol-06a3ec5ec2de8a5cf","vol-022d680e1758182ce","vol-0e7c9c3a699217201","vol-0195ce6de17752578","vol-09493c490bda1120c","vol-06e6e415dd229dd1f","vol-08e129b097ac82fe8","vol-0215097d747f7d343","vol-06095d4d7cda606ce","vol-03e9fb320a7d8b99d","vol-08d6dafbd73a4f6a2","vol-08b6e95e02a16933f","vol-08b5e3d6723ff49a6","vol-02a5bba30ebd251c4","vol-0e4f8b5930190748b","vol-0d9a951a441a30b3a"]
  iopsthreshold              = 5000
  evaluation_periods         = 1
  period                    = 300
  burst_balance_threshold   = 95
  emails                   =  ["tivolimonitor@imimobile.com"]
  datapoints_to_alarm   = 2
  }

module "ebs-alerts-vol1" {
  # source the directory path where the ebs-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//EBS-cloudwatch-metrics/?ref=Alerts1.0"
  name_prefix              =  "CNCT007-Connect_Mumbai"
  volumequeuelength_threshold = 1.34
  volume_id     = ["vol-08268340ff5734a64"]
  iopsthreshold              = 10800
  evaluation_periods         = 2
  period                    = 300
  burst_balance_threshold   = 95
  emails                   =  ["tivolimonitor@imimobile.com"]
  datapoints_to_alarm    = 2
  }


module "ebs-alerts-vol2" {
  # source the directory path where the ebs-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//EBS-cloudwatch-metrics/?ref=Alerts1.0"
  name_prefix              =  "CNCT007-Connect_Mumbai"
  volumequeuelength_threshold = 1.34
  volume_id     = ["vol-00714befda709a7f6","vol-0079495c5c1657bb2","vol-0f6cc45a0f00c36f2","vol-00c01dee0006632a5","vol-00c26b1b9f987b142","vol-00f820e5e0e966ffc","vol-0f4ccbe0541f83e2a","vol-0162062b02d75c9fb","vol-016657a7bbc267f99","vol-0195ce6de17752578","vol-0215097d747f7d343","vol-022d680e1758182ce","vol-0251f73b8bf9226f3","vol-0f1cdc798a869f954","vol-02a5bba30ebd251c4","vol-0e94b9019e6d9c39c","vol-0e5330dfd09ca1c5f","vol-03bb5ab863cff5a1c","vol-0df6d9eee1cf5708c","vol-03e16f47561a27cda","vol-0da63e1277e0383b8","vol-0d9a951a441a30b3a","vol-0431503299d553499","vol-0d78fd23e5a1faa1a","vol-047ad191ef951331a","vol-04a39284b5b65a864","vol-04e02f0d85035863d","vol-04e9eb5bb39530125","vol-05615615fecb15dbe","vol-0d0481cd7b4b28e1b","vol-05def1b26226c910c","vol-0c0d7120a2add7dc6","vol-0b9667e439b622279","vol-09e8804755390a430","vol-09937d13a2bf9e94c","vol-0971057e1ede083ed","vol-09555eeaa71533437","vol-0915424e86245ccdd","vol-08f000997650edb1a","vol-06aa4150160a28a4b","vol-06e6e415dd229dd1f","vol-08d6dafbd73a4f6a2","vol-078ed5d8e8891744c","vol-07a5b8ea537d29114","vol-08c772289ec541b18","vol-08b6e95e02a16933f","vol-08a2c36b297a0fd50"]
  iopsthreshold              = 4800
  evaluation_periods         = 2
  period                    = 300
  burst_balance_threshold   = 95
  emails                   =  ["tivolimonitor@imimobile.com"]
  datapoints_to_alarm    = 2
  }


module "ebs-alerts-vol3" {
  # source the directory path where the ebs-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//EBS-cloudwatch-metrics/?ref=Alerts1.0"
  name_prefix              =  "CNCT007-Connect_Mumbai"
  volumequeuelength_threshold = 1.34
  volume_id     = ["vol-0fe9390a328045ec6","vol-0fb5649a145150807","vol-0f74af733baabbf04","vol-0e7c9c3a699217201","vol-0e4f8b5930190748b","vol-0da3ecc98240199d7","vol-0146555c3cffc06c9","vol-0ce0675152974ee5d","vol-0c7aa859b854425a2","vol-0b60c57db5a2d6399","vol-0a7a273258cfa92e7","vol-0a73fd8e68527d536","vol-0995617b112e86c03","vol-09493c490bda1120c","vol-08e129b097ac82fe8","vol-031975f01bac7ad18","vol-08b5e3d6723ff49a6","vol-0831ce5c31f68340e","vol-06a3ec5ec2de8a5cf","vol-063cac7c5ca5bc2b4","vol-03e9fb320a7d8b99d","vol-03fe47a9a98bcca23","vol-05fd84095eacfda5b"]
  iopsthreshold              = 7200
  evaluation_periods         = 2
  period                    = 300
  burst_balance_threshold   = 95
  emails                   =  ["tivolimonitor@imimobile.com"]
  datapoints_to_alarm    =  2
  }


module "ebs-alerts-vol4" {
  # source the directory path where the ebs-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//EBS-cloudwatch-metrics/?ref=Alerts1.0"
  name_prefix              =  "CNCT007-Connect_Mumbai"
  volumequeuelength_threshold = 1.34
  volume_id     = ["vol-0fc92b681cbb363f5","vol-0fc56f8de2975050a","vol-0ddcdb3916dfa8c6a","vol-0d2d2d621074a1502","vol-0d1ab1e50a3d3ceb2","vol-0bb6768f1bb694762","vol-0ae28888978ea2919","vol-0ad7b4015a641ca10","vol-0a7d0876678bb9d6c","vol-0a3098220427aa2fe","vol-0a0025556d54054af","vol-0973e62736fb4bd0e","vol-06a452f098b94f927","vol-047091f4388eddfde"]
  iopsthreshold              = 14400
  evaluation_periods         = 2
  period                    = 300
  burst_balance_threshold   = 95
  emails                   =  ["tivolimonitor@imimobile.com"]
  datapoints_to_alarm    = 2
  }


module "ebs-alerts-vol5" {
  # source the directory path where the ebs-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//EBS-cloudwatch-metrics/?ref=Alerts1.0"
  name_prefix              =  "CNCT007-Connect_Mumbai"
  volumequeuelength_threshold = 1.34
  volume_id     = ["vol-0fe3eaf5eb37c9754","vol-0f3979b0a2881133c","vol-0e971056452a721f1","vol-0df16d8fee5692e90","vol-0dd03df84cda33358","vol-0bd91507c91decff6","vol-09051739dc33c26ec","vol-06095d4d7cda606ce","vol-05ee33074375b5ffb","vol-059058b7b57796740","vol-0321b8dd06a952eb2","vol-028d9df7391272d42"]
  iopsthreshold              = 28800
  evaluation_periods         = 2
  period                    = 300
  burst_balance_threshold   = 95
  emails                   =  ["tivolimonitor@imimobile.com"]
  datapoints_to_alarm    =  2
  }


module "ebs-alerts-vol6" {
  # source the directory path where the ebs-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//EBS-cloudwatch-metrics/?ref=Alerts1.0"
  name_prefix              =  "CNCT007-Connect_Mumbai"
  volumequeuelength_threshold = 1.34
  volume_id     = ["vol-090c8fd2654912807","vol-082cad522227f7f4a","vol-07303a234df545be3"]
  iopsthreshold              = 36000
  evaluation_periods         = 2
  period                    = 300
  burst_balance_threshold   = 95
  emails                   =  ["tivolimonitor@imimobile.com"]
  datapoints_to_alarm    = 2
  }

module "ebs-alerts-vol7" {
  # source the directory path where the ebs-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//EBS-cloudwatch-metrics/?ref=Alerts1.0"
  name_prefix              =  "CNCT007-Connect_Mumbai"
  volumequeuelength_threshold = 1.34
  volume_id     = ["vol-0d870d6637c38778f","vol-00939bbcb6f20b1a4"]
  iopsthreshold              = 43200
  evaluation_periods         = 2
  period                    = 300
  burst_balance_threshold   = 95
  emails                   =  ["tivolimonitor@imimobile.com"]
  datapoints_to_alarm     = 2
  }

module "ebs-alerts-vol8" {
  # source the directory path where the ebs-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//EBS-cloudwatch-metrics/?ref=Alerts1.0"
  name_prefix              =  "CNCT007-Connect_Mumbai"
  volumequeuelength_threshold = 1.34
  volume_id     = ["vol-0ebb046d5cffaf939","vol-0663e48b64b0196aa"]
  iopsthreshold              = 57600
  evaluation_periods         = 2
  period                    = 300
  burst_balance_threshold   = 95
  emails                   =  ["tivolimonitor@imimobile.com"]
  datapoints_to_alarm   = 2
  }

module "ebs-alerts-vol9" {
  # source the directory path where the ebs-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//EBS-cloudwatch-metrics/?ref=Alerts1.0"
  name_prefix              =  "CNCT007-Connect_Mumbai"
  volumequeuelength_threshold = 1.34
  volume_id     = ["vol-0638e8878b76944ef","vol-03ce48cde1ad2c4b6"]
  iopsthreshold              = 5760
  evaluation_periods         = 2
  period                    = 300
  burst_balance_threshold   = 95
  emails                   =  ["tivolimonitor@imimobile.com"]
  datapoints_to_alarm  = 2
  }

module "ebs-alerts-vol10" {
  # source the directory path where the ebs-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//EBS-cloudwatch-metrics/?ref=Alerts1.0"
  name_prefix              =  "CNCT007-Connect_Mumbai"
  volumequeuelength_threshold = 1.34
  volume_id     = ["vol-0f937d6968917b2f1","vol-0f3bcef699d865d94"]
  iopsthreshold              = 50000
  evaluation_periods         = 2
  period                    = 300
  burst_balance_threshold   = 95
  emails                   =  ["tivolimonitor@imimobile.com"]
  datapoints_to_alarm  = 2
  }


module "ebs-alerts-vol11" {
  # source the directory path where the ebs-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//EBS-cloudwatch-metrics/?ref=Alerts1.0"
  name_prefix              =  "CNCT007-Connect_Mumbai"
  volumequeuelength_threshold = 1.34
  volume_id     = ["vol-098c2cb80bdab2183"]
  iopsthreshold              = 72000
  evaluation_periods         = 2
  period                    = 300
  burst_balance_threshold   = 95
  emails                   =  ["tivolimonitor@imimobile.com"]
  datapoints_to_alarm      = 2
  }


module "ec2-alerts" {
  # source the directory path where the ec2-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//ec2-cloudwatch-alerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT007-Connect_Mumbai"
  evaluation_periods        = 1
  period                    = 300
  cpu_utilization_threshold  = 80
  Disk_read_ops_threshold    = 80
  Disk_write_ops_threshold   = 80
 # status_check_threshold     = 1
  instance_read_write_ids     = ["i-0cd658852afc80d55","i-035fde162d12f6dfe","i-05c56f645502fc21e","i-02ac5953212b664f2","i-0ea4664bcc5435af6","i-0ee971fd9673ae6ca","i-016b180d255f0977b","i-0e11017c13f12a6ad","i-0186091f277375abe"]
  instance_ids               =  ["i-00ff6ab71ccd91ebb","i-016b180d255f0977b","i-01767839e335d47fe","i-0186091f277375abe","i-01b3d3e9214026dc9","i-01c5cb80cc34f2086","i-020054ff9d0f4095f","i-02ac5953212b664f2","i-02cedd755990f9fff","i-03590cded0ec976ac","i-035fde162d12f6dfe","i-0370d517ec5836ed4","i-038c3d78abeac23f9","i-03bd95abf04fff4a7","i-0431f22ff840bc0f2","i-0454cbc253c8c1df9","i-04ed068470dad629c","i-04f46e8822eb86a46","i-050fd0b9a8128390d","i-0589349374325b9e6","i-0591de95e8f89fa99","i-05c56f645502fc21e","i-05dc865fbf1cf6688","i-05e290fecb6a3fac5","i-05ff187b5345678b8","i-06480e26943fe1aff","i-069fe6a3e46adbe3a","i-074479780d3b63a15","i-07ac29a891b4e4520","i-07b9780a991867b36","i-07e1ce5bf84ad0efc","i-082b1f1dd2a9df51b","i-087870d2937dd1978","i-087aed4373182c1b3","i-088ded2e0e7ae230a","i-08e4c60200d20b979","i-09011e1b5ee6e2e5d","i-094329aef4e3582ca","i-0952648f1c0088c2f","i-0956f0593d762d0f8","i-0a0370d112bc84f4c","i-0a54ef1fdd6c2dd63","i-0a988c9405615ece9","i-0acdb50cfcb70c4dd","i-0b2b628e499ca90c4","i-0b9de981172d0d4c9","i-0bf70ba95f04c4899","i-0c2acd55919eda504","i-0cd658852afc80d55","i-0d7403dac0d05fbcf","i-0e11017c13f12a6ad","i-0e46651ced19b5a55","i-0ea4664bcc5435af6","i-0ee971fd9673ae6ca","i-0f2507fca67ee0875","i-0fa52b2255147baa7"]
  emails                   =  ["tivolimonitor@imimobile.com"]
  }


module "ecs-alerts" {
  # source the directory path where the ecs-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//ecs-cloudwatch-metrics/?ref=alerts1.2"
  name_prefix              =  "CNCT007-Connect_Mumbai"
  evaluation_periods         = 1
  emails                   =  ["tivolimonitor@imimobile.com"]
  ecs_cluster_name          = ["WhatsappMainCluster","gateway","sfe","ui","core"]
  cpu_reservation_high_threshold = 80
  cpu_utilization_high_threshold  = 80 
  period                         = 300
  cluster_arn                    = ["arn:aws:ecs:ap-south-1:734844872213:cluster/core","arn:aws:ecs:ap-south-1:734844872213:cluster/gateway","arn:aws:ecs:ap-south-1:734844872213:cluster/sfe","arn:aws:ecs:ap-south-1:734844872213:cluster/ui","arn:aws:ecs:ap-south-1:734844872213:cluster/WhatsappMainCluster"]
  memory_utilization_high_threshold = 80
  memory_reservation_high_threshold  = 95
  }

module "efs-alerts" {
  # source the directory path where the efs-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//efs-cloudwatch-alerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT007-Connect_Mumbai"
  evaluation_periods         = 1
  period                    = 300
  emails                   =  ["tivolimonitor@imimobile.com"]
  client_connections_threshold  = "1"
  filesystem_id                 = ["fs-6025e1b1"]
  burst_credit_balance_threshold  = "2199023255552"
  percent_io_limit_threshold      = "1.05e+8"
  total_io_threshold              = "100000"
  permitted_threshold             = "110100480"
  }

  module "elastiCache-alerts" {
  # source the directory path where the elastiCache module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//Elasticache-cloudwatch-metrics/?ref=Alerts1.0"
  name_prefix              =  "CNCT007-Connect_Mumbai"
  evaluation_periods         = 1
  period                    = 300
  emails                   =  ["tivolimonitor@imimobile.com"]
  cache_cluster_id         =  ["imiconnect-redis-001"]
  cpuutilization_threshold = 15
  enginecpuutilization_threshold  = 25
  replication_threshold     = 1
  swap_usage_threshold   = "1.1e+7"
  }

  module "elb-alerts" {
  # source the directory path where the elb module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//ELB-cloudwatch-metrics/?ref=Alerts1.0"
  name_prefix              =  "CNCT007-Connect_Mumbai"
  evaluation_periods         = 1
  period                    = 300
  emails                   =  ["tivolimonitor@imimobile.com"]
  alb_arn_suffix           = ["arn:aws:elasticloadbalancing:ap-south-1:734844872213:loadbalancer/app/admincosole/0f55c0ac04f24019","arn:aws:elasticloadbalancing:ap-south-1:734844872213:loadbalancer/app/ecs-internal/27040bba2cabc180","arn:aws:elasticloadbalancing:ap-south-1:734844872213:loadbalancer/app/public-api/8fd3b56008def837","arn:aws:elasticloadbalancing:ap-south-1:734844872213:loadbalancer/app/star/ddc791941d599ab9","arn:aws:elasticloadbalancing:ap-south-1:734844872213:loadbalancer/app/star-local-http/4ac1949aa3223297","arn:aws:elasticloadbalancing:ap-south-1:734844872213:loadbalancer/app/whatsapp-core/391fa73e91f98bb0"]
  threshold_backend_5xx    = 1
  threshold_elb_5xx        = 1
  threshold_high_latency   = 1
  threshold_target_connection_error_count = 15
  threshold_unhealthy_host_count  = 1
  threshold_healthy_host_count    = 1
  threshold_backend_4xx           = 1
  threshold_elb_4xx               = 1
  threshold_active_connection_count  = 150
  }

  module "lambda-alerts" {
  # source the directory path where the lambda module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//lambda-alerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT007-Connect_Mumbai"
  evaluation_periods         = 1
  period                    = 300
  emails                   =  ["tivolimonitor@imimobile.com"]
  function_name            =  ["drainer-sfe","drainer-gateway","drainer-core","drainer-ui","imi-whatsapp-as-mumbai","DynamoDB_putItem","whatsapp-decision","whatsapp-randompriority","whatsapp-ssm","DynamoDB_getItem","whatsapp-createuser"]
  errors_threshold          = 1
  }

  module "dynamodb-alerts" {
  # source the directory path where the dynamodb-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//dynamodb-cloudwatchalerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT007-Connect_Mumbai"
  evaluation_periods         = 1
  period                    = 300
  alarm_description        = "dynamoalarm"
  alarms_email               =  ["tivolimonitor@imimobile.com"]
  statistic                =  "Average"
  AccountProvisionedWriteCapacityUtilizationthreshold  = "0.11"
  MaxProvisionedTableReadCapacityUtilizationthreshold  = "0.01"
  MaxProvisionedTableWriteCapacityUtilizationthreshold  = "0.03"
  AccountProvisionedReadCapacityUtilizationthreshold    = "0.11"
}


module "nlb-alerts" {
  # source the directory path where the nlb-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//nlb_cloudwatchalerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT007-Connect_Mumbai"
  evaluation_periods         = 1
  period                    = 300
  emails                   =  ["tivolimonitor@imimobile.com"]
  statistic                 =  "Average"
  threshold                 =  1
  targetgroup               =  ["targetgroup/PM-RMI-1098/2202e82a68422329","targetgroup/elk-9300/0e0e964dcbd042fe"]
  networkloadbalancername      = ["net/stat-local-tcp/f8766c5d68ba389f"]

}

module "moscanlb-alerts" {
  # source the directory path where the moscanlb module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//nlb_cloudwatchalerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT007-Connect_Mumbai"
  evaluation_periods         = 1
  period                    = 300
  emails                   =  ["tivolimonitor@imimobile.com"]
  statistic                 =  "Average"
  threshold                 =  1
  targetgroup               =  ["targetgroup/sftp-22/5d0c9caddf67e0aa","targetgroup/mosca-1883/a463692acb588c44","targetgroup/mosca-1884/31a3873ff4f0e239","targetgroup/mosca-8883/1018c591411866ee","targetgroup/mosca-8884/889af913108dcc82"]
networkloadbalancername      = ["net/mosca/9d8f685e0cea1c57"]
}


#module "rds-alerts" {
  # source the directory path where the rds-alerts module is located.
#  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//rds_cloudwatchalerts/?ref=Alerts1.0"
#  name_prefix              =  "CNCT007-Connect_Mumbai"
#  evaluation_periods         = 1
#  period                    = 300
#  alarms_email                  =  ["tivolimonitor@imimobile.com"]
#  statistic                 =  "Average"
 # dbinstanceids             =  ["config-db","wm13rx06ho41s52","wm1nrjvn4jguno9","wm7w4tg289ndmh"]
 # burst_balance_threshold    = 20
 # cpu_credit_balance_threshold =20
 # disk_queue_depth_threshold  = 80
 # swap_usage_threshold        = "256000000"
 # WriteLatencyThreshold       = 20
 # WriteIOPSThreshold          = 400
 # ReadIOPSThreshold           = 80
 # DatabaseConnectionsThreshold  = 800
 # BurstBalanceThreshold        = 80
 # CPUUtilizationThreshold      = 80
 # }

module "sns-alerts" {
  # source the directory path where the sns module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//sns_cloudwatchalerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT007-Connect_Mumbai"
  evaluation_periods         = 1
  period                    = 300
  emails                   =  ["tivolimonitor@imimobile.com"]
  topicname                =  ["Elasticcache_alerts","RDS-NOTIFICATIONS","VPN-TunnelStatus","asg-drainer-core","asg-drainer-gateway","asg-drainer-sfe","asg-drainer-ui","connect-india-alerts","dynamodb","dynamodb-alerts","ebs_alerts","ec2_alerts","ecs_alarm","elb_alarms","gateway_alarms","l2-support","lambda-Errors-alerts","networklb-alerts","rds-alerts","vpn-alerts","whatsappalerts","efs_alarms"]
  NumberOfNotificationsFailedalarmthreshold   = 0
  add_sns_policy           = "false"
  }

module "vpn-alerts" {
  # source the directory path where the vpn alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//vpn_cloudwatchalerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT007-Connect_Mumbai"
  evaluation_periods         = 1
  period                    = 300
  alarms_email              =  ["tivolimonitor@imimobile.com"]
  statistic                =  "Average"
  add_sns_policy             = "false"
  comparison_operator      = "LessThanThreshold"
  TunnelStatethreshold        = 0
  vpnid                       = ["vpn-056749d873dcd1890", "vpn-0970c25124325a3bb", "vpn-09bea62b6d6980cde"]
  }
