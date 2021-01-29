provider "aws" {
    region     = "us-west-2"
}

terraform {
  backend "s3" {
      bucket  = "imiconnect-oregon-cloudwatch-alerts-tfstate"
      key     = "terraform/apptype/cwalerts/oreogon/cwalerts.tfstate"
      region  = "us-west-2"
      encrypt = true
  }
}

module "apigateway-alerts" {
  # source the directory path where the apigateway-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//Apigateway-metrics/?ref=Alerts1.0"
  name_prefix              =  "CNCT005-Connect_Oregon"
  evaluation_periods       =  1
  period                   =  300
  threshold_4xx            =  10
  threshold_5xx            =  10
  threshold_latency        =  2000
  emails                   =  ["tivolimonitor@imimobile.com"]
  api_name                 =  ["imi-whatsapp-as-usprod","RTMSAPI","Santosh-insert-sqs","timeoutmonitor","Walmart_authSignature-API","Walmart_getZipCodeDetails-API","walmart_RefillStoreCount-API"]
  }


module "ebs-alerts" {
  # source the directory path where the ebs-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//EBS-cloudwatch-metrics/?ref=alerts1.2"
  name_prefix              =  "CNCT005-Connect_Oregon"
  volumequeuelength_threshold = 10
  volume_id                  = ["vol-027618860cc9df115","vol-04f369812f7875c44","vol-0d636ca412018f5a7","vol-0d66e0c32870fe940","vol-0554eb9f477a5e076","vol-0e9a557aa3e4188e3","vol-0cf04006e644170ad","vol-04b034a48f9b80c8c","vol-03257ecd61491ba95","vol-0db98f59539c1ab95","vol-0ca50a06381c609e2","vol-0eb451f346a32131f","vol-04d13d35710a2d6e7","vol-0da9c9c780e3b2d0b","vol-02bbd76f92a6f8255","vol-0f185228a6d46e3d9","vol-004a38d2da2ee02cd","vol-03885c1ac4d1dcdc1","vol-0f68850c87e873a24","vol-05d53dc5f5ac98414","vol-0900c11500b30fda0","vol-09afa6a9b248781dc","vol-063b40653124c9257","vol-0a20cf6c64f901aed","vol-0cd9977dcebd644c0","vol-0d6c6a2236fed79d8","vol-0eabfb0cce97f47d4","vol-082846f189fff94c2","vol-0003dbe2e0e76780f","vol-01a2d99fa62150820","vol-05015cc79fef3996a","vol-08ebd455b78866c78","vol-099a6b1dbde08cc57","vol-00bc60dc2fc4e536f","vol-0ecadef8f78a285ff","vol-0bb9e307d8793d6c2","vol-0bdbd0b5ab5b6fddb","vol-0a6b2e4440a4555e6","vol-08e166e9933f8b6ac","vol-07b235b0b59765aa0","vol-04fee6da96dbcc9dc","vol-08a1454ecff66ff67","vol-0acddf8239bd3da83","vol-001c462073566186d","vol-00dbcc3311e3032bb","vol-05d2c491203855019","vol-07b6fe9dc1bb937af","vol-00517d1d7327a20ef","vol-0ac1e3989c81acd9c","vol-0e94aaf5b1c317825","vol-093bad609c23a773e","vol-04d2d7cffe144cf5d","vol-098f694f8c49e69c5","vol-0131b8d440494cea4","vol-005ccdec4651befa9","vol-0659549bd436c6a43","vol-044bcb0c7a047536d","vol-06dfc71d061c66266","vol-05ab2e0056ee3a5e0","vol-09fedc296b401b644","vol-0e9a8402c41d69cd7","vol-0a7ce38d74ab9c983","vol-001c4cb61a05fd709","vol-0ab042beaeffedbe2","vol-02f4534da49426c51","vol-03cb2ee94fe9d6589","vol-0636dfe35eb711330","vol-09d526d2eda02fb4c","vol-0748d5b07f14c584c","vol-0a089a9ca0868b039","vol-091509093ec487835","vol-0de71d0d4daff7f4b","vol-03a17a565ccf1250f","vol-093e166c50f11454d","vol-06e9bf20507276f66","vol-0ad1f602ee2b41815","vol-05cd3aec6220b8e37","vol-05b29f7713066efc9","vol-05f256554f567ac0b","vol-047ab9816cd5c7ab1","vol-0dc677b46dd4da602","vol-0b6c1e76bc1d6624f","vol-0ae972ba86b429d7e","vol-0fb901223c2f2f7fe","vol-0064aaf92d7d0f098","vol-053085235aeb6cffd","vol-06ec0ce6700ec0776","vol-024fd7bfc81fb08ca","vol-02f0cefcb05d2e0f3","vol-0c72dfb2b6bcc2de1","vol-012b85d5d0570a5e4","vol-03fdac45c172e85e8","vol-0f17f8b14b983364a","vol-075775db63c4b7d51","vol-0da106e0e7cc0019f","vol-0349adef01f491d05","vol-0b317d7c18ac2c69e","vol-0814bee2caa34c9b5","vol-092423faf52c0c2cf","vol-0d113b8412dacb830","vol-06a11c83ef401fa97","vol-0875493b3310ca92d","vol-06ea74b6f20a94208","vol-06cf27862886894fb","vol-0a7bbeb2314b7b11d","vol-07809e8b6b230d733","vol-0c2ca56e3032b41e2","vol-07316111b7f0376b1","vol-031f2f87a5bb6ade7","vol-05a028786a2cd72c5","vol-0d6f1418e0bac0f84","vol-0bef632e0fa9b3650","vol-07644e28c2c901e47","vol-015f73ef39bdfa363","vol-09cc25c198ce6b856","vol-0aa2a6ab377900f93","vol-0b733c4a830eb9c37","vol-08ea2206c7c6e0f78","vol-0f38a23828c9c07bc","vol-05941f5dae9a94b15","vol-09e382fc01bfaf241","vol-0d8e2497224a363df","vol-0adada48362cc91f0","vol-003f91534d469c674","vol-0858123e6bd1ebf3c","vol-02db6101ee897904b","vol-0f01619d975a9afb7","vol-02dfdbd15e0ec1f22","vol-0a66307829a9b4cc0","vol-0f72f5b233a49407e","vol-08fb8e69fff7bcd99","vol-091f6d00a7f5a508c","vol-044680e8fdb1b85b6","vol-0789c3bd8c55ed23e","vol-0f7855e419958291f","vol-0f11051b050242ff8","vol-0c4d38f32705de888","vol-0ca93c7230b82cc58","vol-0d87098a88c92d195","vol-0db2be0221f598d70","vol-0482a9b233c94f120","vol-023f87a0dd1fe42a4","vol-0f914415638fa03cf","vol-0afc46baad6b120a6","vol-01c47dfe8da4922ba","vol-02c71c752a2475813","vol-0fce4b267035845f4","vol-0db1f4f023a2ce59d","vol-088b54d76bac3cc1b","vol-0f872042563e26bb1","vol-07b2ab144c5653a1e","vol-0fe902e2fb5f0c1e0","vol-055aaf83ca19366ad","vol-0be713e0d0c1a9802","vol-06ff4e6fe9313b82f","vol-0220ca7f3ce698165","vol-08632a85d5ef36b06","vol-040fccf6b4ca44e7c","vol-015a19e66a8289502","vol-0c0ae907f9280510f","vol-00e3d9d1d6beb2f21","vol-08ccac738f7665e7a","vol-044f385750be5a2c3","vol-028adbc231bea53e4","vol-0c81ed5d0c5c46cf4","vol-0ae61e3b3a0279f80","vol-0f3cc32c069b0029e","vol-08f079f4ada6d2c65","vol-023ecd1fab76b90bb","vol-0cdfa03b151e1d79d","vol-0a7707a3b420f97cb","vol-0c51b8159118f3288","vol-03c00e6002191637c","vol-0c2004796140ef280","vol-06bc6f380d415af45","vol-07aae32a9e705531e","vol-0a1eb817ab0ac13f3","vol-0f0d5e5eb5e1e4a07","vol-0367032354db60986","vol-011200328d0d37dfe","vol-045d00462837dc058","vol-068612defbbb7f22e","vol-043b357521d1a1433","vol-08276295210a707a3","vol-0986b19ae1a150a1f"]
 
   iopsthreshold              = 5000
  evaluation_periods         = 1
  period                    = 300
  burst_balance_threshold   = 95
  emails                   =  ["tivolimonitor@imimobile.com"]
  datapoints_to_alarm    = 1
  }


module "ebs-alerts-vol1" {
  # source the directory path where the ebs-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//EBS-cloudwatch-metrics/?ref=alerts1.2"
  name_prefix              =  "CNCT005-Connect_Oregon"
  volumequeuelength_threshold = 10
  volume_id                =  ["vol-031f2f87a5bb6ade7","vol-09e382fc01bfaf241","vol-0858123e6bd1ebf3c","vol-001c462073566186d","vol-0c2ca56e3032b41e2","vol-00f35117b59f8bbf0","vol-0b733c4a830eb9c37","vol-003f91534d469c674","vol-00b589c7d5da6a0fd","vol-00fcfa806b7253b08","vol-01615e72516288cf3","vol-01b1c8b4b79eaaca1","vol-01cf545f5a93ffb8a","vol-04e421e205afc1964","vol-061e2e1479f35a84a","vol-06454cc75b28e2625","vol-0babdb0c3b2d0491f","vol-0cdfa03b151e1d79d","vol-0d3d2b9888fc16575","vol-0da8af2f66314d743","vol-0db1f4f023a2ce59d","vol-0e81c839d6ab62681"]
  evaluation_periods         = 1
  iopsthreshold              = 4800
  period                    = 300
  burst_balance_threshold   = 95
  emails                   =  ["tivolimonitor@imimobile.com"]
  datapoints_to_alarm    = 1
  }

module "ebs-alerts-vol2" {
    # source the directory path where the ebs-alerts module is located.
    source = "git::https://git.imimobile.net/imidevops/cwalerts.git//EBS-cloudwatch-metrics/?ref=alerts1.2"
    name_prefix              =  "CNCT005-Connect_Oregon"
    volumequeuelength_threshold = 10
    volume_id                =  ["vol-093e166c50f11454d","vol-0de71d0d4daff7f4b","vol-015e025c820a972f4","vol-0ad1f602ee2b41815","vol-09b8ffd8b3742cf48","vol-093bad609c23a773e","vol-0bbfc87f3ed627664","vol-04b034a48f9b80c8c","vol-0a20c0cb73f3d21b8","vol-0e94aaf5b1c317825","vol-029b329a50abdd9a8","vol-0cf04006e644170ad","vol-038e42e77be081a1c","vol-044bcb0c7a047536d","vol-0f185228a6d46e3d9","vol-02bbd76f92a6f8255","vol-0a089a9ca0868b039","vol-09d526d2eda02fb4c","vol-0ab042beaeffedbe2","vol-001c4cb61a05fd709","vol-03cb2ee94fe9d6589","vol-02f4534da49426c51","vol-0da9c9c780e3b2d0b","vol-04d13d35710a2d6e7","vol-05b29f7713066efc9"]
    evaluation_periods         = 1
    iopsthreshold              = 5760
    period                    = 300
    burst_balance_threshold   = 95
    emails                   =  ["tivolimonitor@imimobile.com"]
    datapoints_to_alarm    = 1
    }

module "ebs-alerts-vol3" {
    # source the directory path where the ebs-alerts module is located.
    source = "git::https://git.imimobile.net/imidevops/cwalerts.git//EBS-cloudwatch-metrics/?ref=alerts1.2"
    name_prefix              =  "CNCT005-Connect_Oregon"
    volumequeuelength_threshold = 10
    volume_id                =  ["vol-0f17f8b14b983364a","vol-099d77391287f8763","vol-07644e28c2c901e47","vol-0c72dfb2b6bcc2de1","vol-00beee5b1b2d59364","vol-075775db63c4b7d51"]
    evaluation_periods         = 1
    iopsthreshold              = 7200
    period                    = 300
    burst_balance_threshold   = 95
    emails                   =  ["tivolimonitor@imimobile.com"]
    datapoints_to_alarm    = 1
    }

module "ebs-alerts-vol4" {
    # source the directory path where the ebs-alerts module is located.
    source = "git::https://git.imimobile.net/imidevops/cwalerts.git//EBS-cloudwatch-metrics/?ref=alerts1.2"
    name_prefix              =  "CNCT005-Connect_Oregon"
    volumequeuelength_threshold = 10
    volume_id                =  ["vol-0003dbe2e0e76780f","vol-08e166e9933f8b6ac","vol-082846f189fff94c2","vol-0a6b2e4440a4555e6","vol-0b6c1e76bc1d6624f","vol-0dc677b46dd4da602","vol-047ab9816cd5c7ab1","vol-05f256554f567ac0b","vol-0fd43a50ed3f88532","vol-0d87098a88c92d195","vol-02db6101ee897904b","vol-05d2c491203855019","vol-00dbcc3311e3032bb","vol-03a17a565ccf1250f","vol-091509093ec487835","vol-09061cfab0f0534e2","vol-0fbcf3cc151d23954","vol-0f67a5497dbc9921c","vol-0d0e631efa6d4b127","vol-064a0d4e2cfe0b3c4","vol-039d77034c610b2c1","vol-0aa2a6ab377900f93","vol-0659549bd436c6a43","vol-005ccdec4651befa9","vol-0131b8d440494cea4","vol-0ac1e3989c81acd9c","vol-098f694f8c49e69c5","vol-00517d1d7327a20ef","vol-04d2d7cffe144cf5d","vol-07b6fe9dc1bb937af","vol-023f87a0dd1fe42a4","vol-0eb451f346a32131f","vol-0ca50a06381c609e2","vol-013382b4c30da7edf","vol-085149aacb08a0d09","vol-02f6f55fcebca3554","vol-0ca93c7230b82cc58","vol-09cc25c198ce6b856","vol-0064aaf92d7d0f098","vol-07316111b7f0376b1","vol-0bdbd0b5ab5b6fddb","vol-0eabfb0cce97f47d4","vol-0bb9e307d8793d6c2","vol-0d6c6a2236fed79d8","vol-0b02c66bd2bb352ee","vol-0327065bf41f9f960","vol-08fb8e69fff7bcd99","vol-0f72f5b233a49407e","vol-0c4d38f32705de888","vol-06a4b5a41cbd7a1a6","vol-0f86502cdfaf76d43","vol-0f7855e419958291f","vol-08b6fbf9711d55da4","vol-0d27529b00ab6b7f3","vol-0748d5b07f14c584c","vol-0636dfe35eb711330","vol-0cd9977dcebd644c0","vol-0ecadef8f78a285ff","vol-00bc60dc2fc4e536f","vol-0a20cf6c64f901aed","vol-0145700e1b65874af","vol-024dc7b666fda4d78","vol-04772d6a98169f301","vol-04ec85af81485c54e","vol-06828202467c87f83","vol-0758d793cbc2e5d8c","vol-0b544a4b2d7315a5c","vol-0c0a2c95ce5bfcb26","vol-05a028786a2cd72c5","vol-07b235b0b59765aa0","vol-04fee6da96dbcc9dc","vol-05015cc79fef3996a","vol-01a2d99fa62150820","vol-0acddf8239bd3da83","vol-099a6b1dbde08cc57","vol-08a1454ecff66ff67","vol-08ebd455b78866c78","vol-0fb901223c2f2f7fe","vol-0ae972ba86b429d7e","vol-09fedc296b401b644","vol-05ab2e0056ee3a5e0","vol-0a7ce38d74ab9c983","vol-0e9a8402c41d69cd7","vol-0db98f59539c1ab95","vol-03257ecd61491ba95","vol-03fdac45c172e85e8","vol-012b85d5d0570a5e4","vol-00aeb753f57993162","vol-00e3d9d1d6beb2f21","vol-0147de5d11e8c30ff","vol-015a19e66a8289502","vol-01c47dfe8da4922ba","vol-0220ca7f3ce698165","vol-023ecd1fab76b90bb","vol-027618860cc9df115","vol-028adbc231bea53e4","vol-02c71c752a2475813","vol-0367032354db60986","vol-03c00e6002191637c","vol-03e509a4f9ea6fb3b","vol-040fccf6b4ca44e7c","vol-044680e8fdb1b85b6","vol-04478578952d1da3a","vol-044a3e8c7769fa7ac","vol-044f385750be5a2c3","vol-0482a9b233c94f120","vol-0493be34dda87b243","vol-04f369812f7875c44","vol-052f500340b74cf44","vol-0554eb9f477a5e076","vol-055aaf83ca19366ad","vol-067dab5440c5a79d5","vol-06bc6f380d415af45","vol-06dfc71d061c66266","vol-06ff4e6fe9313b82f","vol-0789c3bd8c55ed23e","vol-07b2ab144c5653a1e","vol-081b345f72e279f38","vol-08632a85d5ef36b06","vol-088b54d76bac3cc1b","vol-08ccac738f7665e7a","vol-08ea2206c7c6e0f78","vol-08f079f4ada6d2c65","vol-091f6d00a7f5a508c","vol-099753cd066f617e1","vol-09c8a1b9829e4a42c","vol-09ceb22a0df974e71","vol-0a66307829a9b4cc0","vol-0a7707a3b420f97cb","vol-0adada48362cc91f0","vol-0afc46baad6b120a6","vol-0b4378de56a62ede5","vol-0bdcdb3da6664a1d3","vol-0be713e0d0c1a9802","vol-0bef632e0fa9b3650","vol-0c0ae907f9280510f","vol-0c1bdf54a7d8d612b","vol-0c2004796140ef280","vol-0c51b8159118f3288","vol-0c5daffee288c43e3","vol-0c81ed5d0c5c46cf4","vol-0cbc3cffefba87150","vol-0d1cce6e3c01f9d91","vol-0d636ca412018f5a7","vol-0d66e0c32870fe940","vol-0d6f1418e0bac0f84","vol-0db2be0221f598d70","vol-0e46708eb8ae05601","vol-0e92b2736edd9eb34","vol-0e9a557aa3e4188e3","vol-0f29b2227953f64b3","vol-0f38a23828c9c07bc","vol-0f3cc32c069b0029e","vol-0f872042563e26bb1","vol-0f914415638fa03cf","vol-0fce4b267035845f4","vol-0fe902e2fb5f0c1e0","vol-0ff4c830c4e90bcea","vol-015f73ef39bdfa363","vol-0d8e2497224a363df"]
    evaluation_periods         = 1
    iopsthreshold              = 14400
    period                    = 300
    burst_balance_threshold   = 95
    emails                   =  ["tivolimonitor@imimobile.com"]
    datapoints_to_alarm    = 1
    }

module "ebs-alerts-vol5" {
    # source the directory path where the ebs-alerts module is located.
    source = "git::https://git.imimobile.net/imidevops/cwalerts.git//EBS-cloudwatch-metrics/?ref=alerts1.2"
    name_prefix              =  "CNCT005-Connect_Oregon"
    volumequeuelength_threshold = 10
    volume_id                =  ["vol-00a295cc668dc3af5","vol-0e28d7fa416254e52","vol-04f7012948301f671","vol-03482eab6ffefd0bc"]
    evaluation_periods         = 1
    iopsthreshold              = 28800
    period                    = 300
    burst_balance_threshold   = 95
    emails                   =  ["tivolimonitor@imimobile.com"]
    datapoints_to_alarm    = 1
    }

module "ebs-alerts-vol6" {
    # source the directory path where the ebs-alerts module is located.
    source = "git::https://git.imimobile.net/imidevops/cwalerts.git//EBS-cloudwatch-metrics/?ref=alerts1.2"
    name_prefix              =  "CNCT005-Connect_Oregon"
    volumequeuelength_threshold = 10
    volume_id                =  ["vol-05cd3aec6220b8e37","vol-06e9bf20507276f66","vol-063b40653124c9257"]
    evaluation_periods         = 1
    iopsthreshold              = 36000
    period                    = 300
    burst_balance_threshold   = 95
    emails                   =  ["tivolimonitor@imimobile.com"]
    datapoints_to_alarm    = 1
    }

module "ebs-alerts-vol7" {
    # source the directory path where the ebs-alerts module is located.
    source = "git::https://git.imimobile.net/imidevops/cwalerts.git//EBS-cloudwatch-metrics/?ref=alerts1.2"
    name_prefix              =  "CNCT005-Connect_Oregon"
    volumequeuelength_threshold = 10
    iopsthreshold              = 43200
    volume_id                =  ["vol-02f0cefcb05d2e0f3","vol-053085235aeb6cffd"]
    evaluation_periods         = 1
    period                    = 300
    burst_balance_threshold   = 95
    emails                   =  ["tivolimonitor@imimobile.com"]
    datapoints_to_alarm    = 1
    }

module "ebs-alerts-vol8" {
    # source the directory path where the ebs-alerts module is located.
    source = "git::https://git.imimobile.net/imidevops/cwalerts.git//EBS-cloudwatch-metrics/?ref=alerts1.2"
    name_prefix              =  "CNCT005-Connect_Oregon"
    volumequeuelength_threshold = 10
    iopsthreshold              = 72000
    volume_id                =  ["vol-0d6ed96dd8284f7ce","vol-051b29255e9579b2b","vol-03c8607a70ca4ad83","vol-0f11051b050242ff8","vol-04d4f4b5df3e22161","vol-009d1d36ff278a8e4","vol-02dfdbd15e0ec1f22","vol-049b5e8e95349a7a3","vol-057b05b8ed9ee776f","vol-05941f5dae9a94b15","vol-07aae32a9e705531e","vol-08276295210a707a3","vol-0986b19ae1a150a1f","vol-0ae61e3b3a0279f80","vol-0f01619d975a9afb7"]
    evaluation_periods         = 1
    period                    = 300
    burst_balance_threshold   = 95
    emails                   =  ["tivolimonitor@imimobile.com"]
    datapoints_to_alarm    = 1
    }

module "ebs-alerts-vol9" {
    # source the directory path where the ebs-alerts module is located.
    source = "git::https://git.imimobile.net/imidevops/cwalerts.git//EBS-cloudwatch-metrics/?ref=alerts1.2"
    name_prefix              =  "CNCT005-Connect_Oregon"
    volumequeuelength_threshold = 10
    volume_id                =  ["vol-00c858ca553dddeca","vol-0a1eb817ab0ac13f3","vol-0f0d5e5eb5e1e4a07"]
    evaluation_periods         = 1
    iopsthreshold              = 5000
    period                    = 300
    burst_balance_threshold   = 95
    emails                   =  ["tivolimonitor@imimobile.com"]
    datapoints_to_alarm    = 1
    }

module "ebs-alerts-vol10" {
    # source the directory path where the ebs-alerts module is located.
    source = "git::https://git.imimobile.net/imidevops/cwalerts.git//EBS-cloudwatch-metrics/?ref=alerts1.2"
    name_prefix              =  "CNCT005-Connect_Oregon"
    volumequeuelength_threshold = 10
    volume_id                =  ["vol-045d00462837dc058","vol-0f87e56d430773be9","vol-043b357521d1a1433","vol-09de7f16f4bf7fa5c","vol-068612defbbb7f22e","vol-082f2d16674d7980c","vol-011200328d0d37dfe","vol-096d902569372f6ae"]
    evaluation_periods         = 1
    iopsthreshold              = 504000
    period                    = 300
    burst_balance_threshold   = 95
    emails                   =  ["tivolimonitor@imimobile.com"]
    datapoints_to_alarm    = 1
    }


module "ec2-alerts" {
  # source the directory path where the ec2-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//ec2-cloudwatch-alerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT005-Connect_Oregon"
  evaluation_periods        = 1
  period                    = 300
  cpu_utilization_threshold  = 80
  Disk_read_ops_threshold    = 80
  instance_read_write_ids    = ["i-0017760fa71b2ed64","i-00314b21a759d7fc3","i-0051a45768d9e272a","i-0088dec5ee32f9bdd","i-0097ebcd24dcc9245","i-00adce414d2346313","i-01285cdb62c2a173c","i-0166e72457a1385ea","i-017947e4f9739d6d5","i-01b77b683299fb6ee","i-01cc339d9e5d63ef5","i-020466be23db3bf68","i-02446eac6aea90508","i-028e49011e775a0a9","i-02918399d1574de3c","i-0298a85d4f4ac8a8d","i-029fdcb0853218169","i-02a156014da28ff75","i-0300e6abf19b80b42","i-0340ac07267015b96","i-0348d6c5e674d38e2","i-039403e23aa18db53","i-03bab6f2a917d718f","i-03c587206035954a8","i-03da02552b6a8884c","i-043736e3414903394","i-046afcd54519999bd","i-04a36f96d6b807d92","i-04b6889077435bc76","i-04c05f90846901adc","i-04cee51d957d9cc5b","i-05046f85dc85e1c46","i-054c5bd0f24862039","i-05533c6d76e362d1d","i-05982477c9175419e","i-059d65513c22078d1","i-059f437eb6a77c2dc","i-060b60daa38a9f358","i-063770718010157b1","i-067329ce10518cfa1","i-06c5dfb76e4200204","i-06e5bb8ff587e61a8","i-073a42e5dcb313303","i-0748ec631a31c3c81","i-0767133f4a097b232","i-07af379b416bbb511","i-07c2610628151d22a","i-07d2db97fca4be4b3","i-07d93abd2e886b036","i-07f4563384df804eb","i-07f61a3eb218cb83e","i-080bf2c63b6ffa7fc","i-08304ad0f79703aba","i-0837f46a5b52fd83e","i-08677bfc13c5b069c","i-089594fb8bc8cac3e","i-089d0ecc068715ca1","i-08a6325a0a4acdd0f","i-08aa07a35470f5b16","i-08b257b3c8407e64a","i-08b5acf7dea8cbc27","i-08bd982645d5de5e0","i-08fce3d5712a4e062","i-09049204eade626dd","i-091313e38ef1c6c38","i-09320ea2b5d88c461","i-093f1754ae4c6f72c","i-09488ed947c63b626","i-0951edb5abd787b44","i-0951ef2cd817f1c81","i-098a7ce88795d0977","i-09c0074b178fc99df","i-09fdc5df6b2c780f9","i-0a03d5fd7bc3b2c4a","i-0a19b4f36ac0b045b","i-0a3b33724c5b83ea4","i-0a83ea104af5fad72","i-0a9ae73b3e8196d6c","i-0aa527ac336b15d6a","i-0af5423595c330547","i-0afa225d9d28ca3fc","i-0affeac57d8fb912f","i-0b37523acffd7fbcb","i-0b379e23f90b47979","i-0b6cb1a7614823eb6","i-0b816f2b8e8d4011c","i-0bbe152480b35d951","i-0bbed913b916920e5","i-0bf261531df4573af","i-0c0c7ce4aeece0bd2","i-0c0e627d2c8cc9c86","i-0c2a688931ff5f0e8","i-0c2f2dcc76313cca1","i-0c35e6ef4acc57b89","i-0c557123bb7c1ec04","i-0c99ec8b34f8ec716","i-0cca55136bafeab20","i-0cd06f98626276309","i-0ceb692029960c43d","i-0cf4288c796bb8c2d","i-0d3716797d4f2723d","i-0d47c393e5843e0fa","i-0d672649d569b2ed3","i-0d705493aee0c7b50","i-0d948a2616d5370a5","i-0da1f9f8ce6996418","i-0dea1abfdcae41eab","i-0e06982edc2500273","i-0e5d2e6a286b6229c","i-0e65946bad9feba47","i-0e7051e12723a2baa","i-0ea05e9e1f803b0f9","i-0ee37d4cbb0591324","i-0f03355563a80f72e","i-0f73e6fadf774b5a9","i-0f8cf4db886ab9fed","i-0f92e94c8be0d7b07","i-0f9eb61ed1506a66e","i-0fa9c3b5a4efc70eb","i-0fec8b445da018455","i-0ff498cf02102000a"]
  Disk_write_ops_threshold   = 80
  instance_ids               = ["i-0017760fa71b2ed64","i-00314b21a759d7fc3","i-0051a45768d9e272a","i-0088dec5ee32f9bdd","i-0097ebcd24dcc9245","i-00adce414d2346313","i-01285cdb62c2a173c","i-0166e72457a1385ea","i-017947e4f9739d6d5","i-01b77b683299fb6ee","i-01cc339d9e5d63ef5","i-020466be23db3bf68","i-02446eac6aea90508","i-028e49011e775a0a9","i-02918399d1574de3c","i-0298a85d4f4ac8a8d","i-029fdcb0853218169","i-02a156014da28ff75","i-0300e6abf19b80b42","i-0340ac07267015b96","i-0348d6c5e674d38e2","i-039403e23aa18db53","i-03bab6f2a917d718f","i-03c587206035954a8","i-03da02552b6a8884c","i-043736e3414903394","i-046afcd54519999bd","i-04a36f96d6b807d92","i-04b6889077435bc76","i-04c05f90846901adc","i-04cee51d957d9cc5b","i-05046f85dc85e1c46","i-054c5bd0f24862039","i-05533c6d76e362d1d","i-05982477c9175419e","i-059d65513c22078d1","i-059f437eb6a77c2dc","i-060b60daa38a9f358","i-063770718010157b1","i-067329ce10518cfa1","i-06c5dfb76e4200204","i-06e5bb8ff587e61a8","i-073a42e5dcb313303","i-0748ec631a31c3c81","i-0767133f4a097b232","i-07af379b416bbb511","i-07c2610628151d22a","i-07d2db97fca4be4b3","i-07d93abd2e886b036","i-07f4563384df804eb","i-07f61a3eb218cb83e","i-080bf2c63b6ffa7fc","i-08304ad0f79703aba","i-0837f46a5b52fd83e","i-08677bfc13c5b069c","i-089594fb8bc8cac3e","i-089d0ecc068715ca1","i-08a6325a0a4acdd0f","i-08aa07a35470f5b16","i-08b257b3c8407e64a","i-08b5acf7dea8cbc27","i-08bd982645d5de5e0","i-08fce3d5712a4e062","i-09049204eade626dd","i-091313e38ef1c6c38","i-09320ea2b5d88c461","i-093f1754ae4c6f72c","i-09488ed947c63b626","i-0951edb5abd787b44","i-0951ef2cd817f1c81","i-098a7ce88795d0977","i-09c0074b178fc99df","i-09fdc5df6b2c780f9","i-0a03d5fd7bc3b2c4a","i-0a19b4f36ac0b045b","i-0a3b33724c5b83ea4","i-0a83ea104af5fad72","i-0a9ae73b3e8196d6c","i-0aa527ac336b15d6a","i-0af5423595c330547","i-0afa225d9d28ca3fc","i-0affeac57d8fb912f","i-0b37523acffd7fbcb","i-0b379e23f90b47979","i-0b6cb1a7614823eb6","i-0b816f2b8e8d4011c","i-0bbe152480b35d951","i-0bbed913b916920e5","i-0bf261531df4573af","i-0c0c7ce4aeece0bd2","i-0c0e627d2c8cc9c86","i-0c2a688931ff5f0e8","i-0c2f2dcc76313cca1","i-0c35e6ef4acc57b89","i-0c557123bb7c1ec04","i-0c99ec8b34f8ec716","i-0cca55136bafeab20","i-0cd06f98626276309","i-0ceb692029960c43d","i-0cf4288c796bb8c2d","i-0d3716797d4f2723d","i-0d47c393e5843e0fa","i-0d672649d569b2ed3","i-0d705493aee0c7b50","i-0d948a2616d5370a5","i-0da1f9f8ce6996418","i-0dea1abfdcae41eab","i-0e06982edc2500273","i-0e5d2e6a286b6229c","i-0e65946bad9feba47","i-0e7051e12723a2baa","i-0ea05e9e1f803b0f9","i-0ee37d4cbb0591324","i-0f03355563a80f72e","i-0f73e6fadf774b5a9","i-0f8cf4db886ab9fed","i-0f92e94c8be0d7b07","i-0f9eb61ed1506a66e","i-0fa9c3b5a4efc70eb","i-0fec8b445da018455","i-0ff498cf02102000a"]
  emails                   =  ["tivolimonitor@imimobile.com"]
  }


module "ecs-alerts" {
  # source the directory path where the ecs-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//ecs-cloudwatch-metrics/?ref=Alerts1.0"
  name_prefix              =  "CNCT005-Connect_Oregon"
  evaluation_periods         = 1
  emails                   =  ["tivolimonitor@imimobile.com"]
  ecs_cluster_name          = ["imiconnectui","api-ump-platform","api-ump-reports","WhatsappMainCluster","avaya9089532042"]
  cpu_reservation_high_threshold = 90
  cpu_utilization_high_threshold  = 80
  period                         = 300
  cluster_arn                   = ["arn:aws:ecs:us-west-2:353589006937:cluster/api-ump-platform","arn:aws:ecs:us-west-2:353589006937:cluster/api-ump-reports","arn:aws:ecs:us-west-2:353589006937:cluster/avaya9089532042","arn:aws:ecs:us-west-2:353589006937:cluster/imiconnectui", "arn:aws:ecs:us-west-2:353589006937:cluster/WhatsappMainCluster"]
  memory_utilization_high_threshold = 80
  memory_reservation_high_threshold  = 80
  }

module "efs-alerts" {
  # source the directory path where the efs-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//efs-cloudwatch-alerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT005-Connect_Oregon"
  evaluation_periods         = 1
  period                    = 300
  emails                   =  ["tivolimonitor@imimobile.com"]
  client_connections_threshold  = "1"
  filesystem_id                 = ["fs-6025e1b1","fs-4cb20ee5","fs-a71fd40e","fs-f2e8f15a"]
  burst_credit_balance_threshold  = "2199023255552"
  percent_io_limit_threshold      = "1.05e+8"
  total_io_threshold              = "100000"
  permitted_threshold             = "110100480"
  }
module "efs-alerts-fs1" {
  # source the directory path where the efs-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//efs-cloudwatch-alerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT005-Connect_Oregon"
  evaluation_periods         = 1
  period                    = 300
  emails                   =  ["tivolimonitor@imimobile.com"]
  client_connections_threshold  = "1"
  filesystem_id                 = ["fs-6bdf14c2"]
  burst_credit_balance_threshold  = "2199023255552"
  percent_io_limit_threshold      = "1.05e+8"
  total_io_threshold              = "100000"
  permitted_threshold             = "1.56e+8"
  }
module "efs-alerts-fs2" {
  # source the directory path where the efs-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//efs-cloudwatch-alerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT005-Connect_Oregon"
  evaluation_periods         = 1
  period                    = 300
  emails                   =  ["tivolimonitor@imimobile.com"]
  client_connections_threshold  = "1"
  filesystem_id                 = ["fs-7eae7b7b"]
  burst_credit_balance_threshold  = "2199023255552"
  percent_io_limit_threshold      = "1.05e+8"
  total_io_threshold              = "100000"
  permitted_threshold             = "2.13e+8"
  }

  module "elastiCache-alerts" {
  # source the directory path where the elastiCache module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//Elasticache-cloudwatch-metrics/?ref=Alerts1.0"
  name_prefix              =  "CNCT005-Connect_Oregon"
  evaluation_periods         = 1
  period                    = 300
  emails                   =  ["tivolimonitor@imimobile.com"]
  cache_cluster_id         =  ["imi-pre-prod-001","imi-pre-prod-002"]
  cpuutilization_threshold = 50
  enginecpuutilization_threshold  = 25
  replication_threshold     = 1
  swap_usage_threshold   = "1"
  }

  module "elb-alerts" {
  # source the directory path where the elb module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//ELB-cloudwatch-metrics/?ref=Alerts1.0"
  name_prefix              =  "CNCT005-Connect_Oregon"
  evaluation_periods         = 1
  period                    = 300
  emails                   =  ["tivolimonitor@imimobile.com"]
  alb_arn_suffix           =  ["arn:aws:elasticloadbalancing:us-west-2:353589006937:loadbalancer/app/ADMINPORTAL/b864e565888a1fb8","arn:aws:elasticloadbalancing:us-west-2:353589006937:loadbalancer/app/API-EXT-IMICONNECT/8d2c2f1096147795","arn:aws:elasticloadbalancing:us-west-2:353589006937:loadbalancer/app/apps-imiconnect-io/7e2ed1d72f565f67","arn:aws:elasticloadbalancing:us-west-2:353589006937:loadbalancer/app/bspoke-schneider-int-lb/f1beec4ebdd6ae2f","arn:aws:elasticloadbalancing:us-west-2:353589006937:loadbalancer/app/conversion-pipe-Public/f916bf6964b961ca","arn:aws:elasticloadbalancing:us-west-2:353589006937:loadbalancer/app/ecs-public/c5307cdd060a6b00","arn:aws:elasticloadbalancing:us-west-2:353589006937:loadbalancer/app/imi-connect-local/59ef512b5bba9969","arn:aws:elasticloadbalancing:us-west-2:353589006937:loadbalancer/app/imi-connect-net/18c85fd21c175509","arn:aws:elasticloadbalancing:us-west-2:353589006937:loadbalancer/app/imi-internal-elklb/6df2183e3a10e0e6","arn:aws:elasticloadbalancing:us-west-2:353589006937:loadbalancer/app/public-api/ae859c721d69d177","arn:aws:elasticloadbalancing:us-west-2:353589006937:loadbalancer/app/rmg-api-imiconnect-net/3cc047392992f5de","arn:aws:elasticloadbalancing:us-west-2:353589006937:loadbalancer/app/whats-Whats-LYGXHHAADWSC/3b82cfad349e5268","arn:aws:elasticloadbalancing:us-west-2:353589006937:loadbalancer/app/whatsapp-core/37d7531baa91f638"]

  threshold_backend_5xx    = 60
  threshold_elb_5xx        = 60
  threshold_high_latency   = 30
  threshold_target_connection_error_count = 30
  threshold_unhealthy_host_count  = 1
  threshold_healthy_host_count    = 2
  threshold_backend_4xx           = 60
  threshold_elb_4xx               = 60
  threshold_active_connection_count  = 70
  }

  module "lambda-alerts" {
  # source the directory path where the lambda module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//lambda-alerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT005-Connect_Oregon"
  evaluation_periods         = 1
  period                    = 300
  emails                   =  ["tivolimonitor@imimobile.com"]
  function_name            =  ["drainer-sfe","drainer-gateway","drainer-core","drainer-ui","imi-whatsapp-as-mumbai","DynamoDB_putItem","whatsapp-decision","whatsapp-randompriority","whatsapp-ssm","DynamoDB_getItem","whatsapp-createuser"]
  errors_threshold          = 1
  }

module "lambda-duration" {
  # source the directory path where the lambda module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//lambda-duration/?ref=Alerts1.0"
  name_prefix              =  "CNCT005-Connect_Oregon"
  evaluation_periods         = 1
  period                    = 300
  emails                   =  ["tivolimonitor@imimobile.com"]
  function_name            =  ["walmart_RefillStoreCount","Walmart_authSignature","Walmart_getZipCodeDetails"]
  duration_threshold          = 500
  }

  module "dynamodb-alerts" {
  # source the directory path where the dynamodb-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//dynamodb-cloudwatchalerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT005-Connect_Oregon"
  evaluation_periods         = 1
  period                    = 300
  alarms_email               =  ["tivolimonitor@imimobile.com"]
  statistic                =  "Average"
  alarm_description        = "dynamodb"
  AccountProvisionedWriteCapacityUtilizationthreshold  = "0.16"
  MaxProvisionedTableReadCapacityUtilizationthreshold  = "0.01"
  MaxProvisionedTableWriteCapacityUtilizationthreshold  = "0.16"
  AccountProvisionedReadCapacityUtilizationthreshold    = "0.16"
}


module "nlb-alerts" {
  # source the directory path where the nlb-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//nlb_cloudwatchalerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT005-Connect_Oregon"
  evaluation_periods         = 1
  period                    = 300
  emails                   =  ["tivolimonitor@imimobile.com"]
  statistic                 =  "Average"
  threshold                 =  1
  targetgroup               =  ["targetgroup/smpp/0cab9b8a802d721b"]
  networkloadbalancername      = ["net/smpp/fc08d0e5dd5efd4f"]
}

module "moscanlb-alerts" {
  # source the directory path where the moscanlb module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//nlb_cloudwatchalerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT005-Connect_Oregon"
  evaluation_periods         = 1
  period                    = 300
  emails                   =  ["tivolimonitor@imimobile.com"]
  statistic                 =  "Average"
  threshold                 =  1
  targetgroup               =  ["targetgroup/connect-policymgr2099/41006896e6d37b18","targetgroup/3c-smpp-4040/528c84cce203ceeb","targetgroup/3c-smpp-4041/8aaff7e5e3851174"]
networkloadbalancername      = ["net/tcp-imi-connect-local/528bc0c7e1aacfef"]
}


module "rds-alerts" {
  # source the directory path where the rds-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//rds_cloudwatchalerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT005-Connect_Oregon"
  evaluation_periods         = 1
  period                    = 300
  alarms_email                  =  ["tivolimonitor@imimobile.com"]
  dbinstanceids             =  ["rdsschneider","voicegwsm"]
  burst_balance_threshold    = 20
  cpu_credit_balance_threshold =20
  disk_queue_depth_threshold  = 80
  swap_usage_threshold        = "256000000"
  WriteLatencyThreshold       = 20
  WriteIOPSThreshold          = 80
  ReadIOPSThreshold           = 80
  DatabaseConnectionsThreshold  = 800
  BurstBalanceThreshold        = 95
  CPUUtilizationThreshold      = 80
  FreeStorageSpaceThreshold    = 92160
  FreeableMemoryThreshold      = 1536
  BinLogDiskUsageThreshold     = 1024
  }
module "rds-alerts-ins01" {
  # source the directory path where the rds-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//rds_cloudwatchalerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT005-Connect_Oregon"
  evaluation_periods         = 1
  period                    = 300
  alarms_email                  =  ["tivolimonitor@imimobile.com"]
  dbinstanceids             =  ["wm1pj5e8afc4ezz"]
  burst_balance_threshold    = 20
  cpu_credit_balance_threshold =20
  disk_queue_depth_threshold  = 80
  swap_usage_threshold        = "256000000"
  WriteLatencyThreshold       = 20
  WriteIOPSThreshold          = 80
  ReadIOPSThreshold           = 80
  DatabaseConnectionsThreshold  = 800
  BurstBalanceThreshold        = 95
  CPUUtilizationThreshold      = 80
  FreeStorageSpaceThreshold    = 25600
  FreeableMemoryThreshold      = 1536
  BinLogDiskUsageThreshold     = 1024
  }
module "rds-imicntprepod" {
    # source the directory path where the rds-alerts module is located.
    source = "git::https://git.imimobile.net/imidevops/cwalerts.git//rds_cloudwatchalerts/?ref=Alerts1.0"
    name_prefix              =  "CNCT005-Connect_Oregon"
    evaluation_periods         = 1
    period                    = 300
    alarms_email                  =  ["tivolimonitor@imimobile.com"]
    dbinstanceids             =  ["imicntprepod"]
    burst_balance_threshold    = 20
    cpu_credit_balance_threshold =20
    disk_queue_depth_threshold  = 80
    swap_usage_threshold        = "256000000"
    WriteLatencyThreshold       = 20
    WriteIOPSThreshold          = 500
    ReadIOPSThreshold           = 80
    DatabaseConnectionsThreshold  = 1000
    BurstBalanceThreshold        = 80
    CPUUtilizationThreshold      = 80
    FreeStorageSpaceThreshold    = 301056
    FreeableMemoryThreshold      = 1536
    BinLogDiskUsageThreshold     = 1024
    }
module "rds-voicegwsm" {
      # source the directory path where the rds-alerts module is located.
      source = "git::https://git.imimobile.net/imidevops/cwalerts.git//rds_cloudwatchalerts/?ref=Alerts1.0"
      name_prefix              =  "CNCT005-Connect_Oregon"
      evaluation_periods         = 1
      period                    = 300
      alarms_email                  =  ["tivolimonitor@imimobile.com"]
      dbinstanceids             =  ["voicegwsm-new","wmzvk5huv3atdh"]
      burst_balance_threshold    = 20
      cpu_credit_balance_threshold =20
      disk_queue_depth_threshold  = 80
      swap_usage_threshold        = "256000000"
      WriteLatencyThreshold       = 20
      WriteIOPSThreshold          = 1500
      ReadIOPSThreshold           = 80
      DatabaseConnectionsThreshold  = 800
      BurstBalanceThreshold        = 80
      CPUUtilizationThreshold      = 80
      FreeStorageSpaceThreshold    = 51200
      FreeableMemoryThreshold      = 1536
      BinLogDiskUsageThreshold     = 1024
      }
  
#module "sns-alerts" {
#  # source the directory path where the sns module is located.
#  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//sns_cloudwatchalerts/?ref=Alerts1.0"
#  name_prefix              =  "CNCT005-Connect_Oregon"
#  evaluation_periods         = 1
#  period                    = 300
#  emails                   =  ["tivolimonitor@imimobile.com"]
#  topicname                =  ["Elasticcache_alerts","RDS-NOTIFICATIONS","VPN-TunnelStatus","asg-drainer-core","asg-drainer-gateway","asg-drainer-sfe","asg-drainer-ui","connect-india-alerts","dynamodb","dynamodb-alerts","ebs_alerts","ec2_alerts","ecs_alarm","elb_alarms","gateway_alarms","l2-support","lambda-Errors-alerts","networklb-alerts","rds-alerts","vpn-alerts","whatsappalerts","efs_alarms"]
#  NumberOfNotificationsFailedalarmthreshold   = 0
#  add_sns_policy             =  "false"
#  alarm_name                 = ""
#  name                       = ""
#  }

module "vpn-alerts" {
  # source the directory path where the vpn alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//vpn_cloudwatchalerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT005-Connect_Oregon"
  evaluation_periods         = 1
  period                    = 300
  statistic                =  "Average"
  comparison_operator      = "LessThanThreshold"
  alarms_email              =  ["tivolimonitor@imimobile.com"]
  add_sns_policy             = "false"
  TunnelStatethreshold        = 1
  vpnid                       = ["vpn-0e42ae4be0a3853a5"]
  }

module "vpn-vpn-60d7cc72" {
    # source the directory path where the vpn alerts module is located.
    source = "git::https://git.imimobile.net/imidevops/cwalerts.git//vpn_cloudwatchalerts/?ref=Alerts1.0"
    name_prefix              =  "CNCT005-Connect_Oregon"
    evaluation_periods         = 1
    period                    = 300
    statistic                =  "Average"
    comparison_operator      =  "LessThanOrEqualToThreshold"
    alarms_email              =  ["tivolimonitor@imimobile.com"]
    add_sns_policy             = "false"
    TunnelStatethreshold        = 0
    vpnid                       = ["vpn-60d7cc72"]
    }

