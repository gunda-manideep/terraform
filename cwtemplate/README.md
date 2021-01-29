### Clone Terraform cwtemplate repo from devops project

```sh
    $ git clone https://git.imimobile.net/imidevops/cwtemplate.git
```

### tfstatefile management

Create a s3 bucket in the AWS account for example if you are going to deploy cloudwatch alerts for London account you can create a S3 bucket in the London account with an example name

S3 bucket name : imiconnect-oregon-cloudwatch-alerts-tfstate
Key name : terraform/apptype/cwalerts/oreogon/cwalerts.tfstate
region : us-west-2

# Terraform installation

To use Terraform you will need to install it. HashiCorp distributes Terraform as a binary package. You can also install Terraform using popular package managers.

To install Terraform, find the appropriate package "https://www.terraform.io/downloads.html" for your system and download it as a zip archive.

After downloading Terraform, unzip the package. Terraform runs as a single binary named terraform. Any other files in the package can be safely removed and Terraform will still function. (You can also compile the Terraform binary from source.)

Finally, make sure that the terraform binary is available on your PATH. This process will differ depending on your operating system.

Follow the steps mentioned in this official docuement "https://learn.hashicorp.com/terraform/getting-started/install.html"

# Connect to AWS environment

  - Install aws cli in your computer follow the steps "https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html"
  - Get the credentials to connect to respective AWS environment.

To create access keys for an IAM user

```sh

Sign in to the AWS Management Console and open the IAM console at https://console.aws.amazon.com/iam/.

In the navigation pane, choose Users.

Choose the name of the user whose access keys you want to create, and then choose the Security credentials tab.

In the Access keys section, choose Create access key.

To view the new access key pair, choose Show. You will not have access to the secret access key again after this dialog box closes. Your credentials will look something like this:

Access key ID: AKIAIOSFODNN7EXAMPLE

Secret access key: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY

To download the key pair, choose Download .csv file. Store the keys in a secure location. You will not have access to the secret access key again after this dialog box closes.

Keep the keys confidential in order to protect your AWS account and never email them. Do not share them outside your organization, even if an inquiry appears to come from AWS or Amazon.com. No one who legitimately represents Amazon will ever ask you for your secret key.

After you download the .csv file, choose Close. When you create an access key, the key pair is active by default, and you can use the pair right away.
```
  - aws configure

```sh
$ aws configure
AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
Default region name [None]: us-west-2
Default output format [None]: json
```


### Verify Terraform resource syntax
- Once you finish updating variable values you have to verify the terraform resource syntax is correct or not by executing below commands this will give you the output which you can read and understand how many resources you are going to create in the AWS environment and what are those.
```sh
    $ terraform init
    $ terraform plan
```

### Create resources using Terraform
- After you executed terraform plan and you confirmed that there are no erros and the resources are appropriate you can deploy the terraform code by using the below command this will create the resources which shown in plan output.
```sh
    $ terraform apply
```

### Terraform tfstatefile

- Terraform must store state about your managed infrastructure and configuration. This state is used by Terraform to map real world resources to your configuration, keep track of metadata, and to improve performance for large infrastructures.

- This state is stored by default in a local file named "terraform.tfstate", but it can also be stored remotely, which works better in a team environment.
- when ever you want to make changes to the deployed resources you should have tfstate file
- If you do manual changes to deployed resources by Terraform from console this file cannot capture those changes. If you want to do changes to deployed resources you must do it from your terraform folder.

### Destorying the created resource using Terraform
- Usage:
```sh
   $ terraform destroy [options] [dir]
```
- Infrastructure managed by Terraform will be destroyed. This will ask for confirmation before destroying.

- This command accepts all the arguments and flags that the apply command accepts, with the exception of a plan file argument.


- The -target flag, instead of affecting "dependencies" will instead also destroy any resources that depend on the target(s) specified. For more information, see the targeting docs from terraform plan.

- The behavior of any terraform destroy command can be previewed at any time with an equivalent terraform plan -destroy command.


### below is example how to add ec2 instance alarm
```sh
module "ec2-alerts" {
  # source the directory path where the ec2-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//ec2-cloudwatch-alerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT009-Connect_Canada"
  evaluation_periods        = 1
  Disk_write_ops_threshold  = 80
  period                    = 300
  cpu_utilization_threshold  = 80
  Disk_read_ops_threshold    = 80
 # status_check_threshold     = 1
  instance_ids               =  ["i-00d06c7b4bca7bc6b","i-020cf6a10e93096ab","i-023410b939c091f4b","i-02c377221eab9d4e9","i-02f870513513cae86","i-03ae805ebd16baa9c","i-03bc71cf8e4665beb","i-0479298269f75e987","i-04ab660ed9662e933","i-058eb3cee496499cb","i-05b43b046258065ff","i-063c588150be5b35f","i-0675e494165c3d634","i-06e562a7af8f5c65d","i-06f8b9087b6d5b915","i-0718cb6366106505b","i-071ccd653f1ba5ab1","i-07209880a17cfca22","i-072d03784a009af03", "i-077fcba28bd90210b","i-07c8b673ea666fac7","i-07e7c15f6316aeacd","i-0800f85d468fb4d50","i-085cb0e06c6517c47","i-08b0d5206a77672c9","i-098bdd4423641a756","i-098d86408bf0ac936","i-0a1f8a4be7e7311c9","i-0a80fa6ac79041bea","i-0a83807597b71a49b","i-0bd0a59f4acb26a67","i-0bdfc4ea1c06da48b","i-0c05038a08d6ee309","i-0c4725aecc6587ade","i-0c53799f250757354","i-0c63a7f327761049f","i-0caf81c5d4a07e5ae","i-0cc78dc33f3c0e615","i-0cd2d59023e3981a0","i-0cd37d7f321afcc49","i-0ceca8a95f86c8a34","i-0cf1627f85239d932","i-0d9b2603a2092a91c","i-0dd75ace52b22ccaf","i-0f1fcf2710d4893fe","i-0f2f47e5fe73eb5b9","i-0f53c74c7df6fd4d8","i-0f664c0cd4f62ed9e","i-0fa057590924ec084","i-0fa61a6318be22489","i-0fa62d789bb042296"]
  emails                   =  ["anupama.s@imimobile.com","manideep.g@imimobile.com"]
  }
```


### Example of how to add RDS alarms

```sh
module "rds-alerts" {
  # source the directory path where the rds-alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//rds_cloudwatchalerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT009-Connect_Canada"
  evaluation_periods         = 1
  period                    = 300
  alarms_email                  =  ["anupama.s@imimobile.com","manideep.g@imimobile.com"]
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
```


### Example how to add VPN alerts

```sh

module "vpn-alerts" {
  # source the directory path where the vpn alerts module is located.
  source = "git::https://git.imimobile.net/imidevops/cwalerts.git//vpn_cloudwatchalerts/?ref=Alerts1.0"
  name_prefix              =  "CNCT009-Connect_Canada"
  evaluation_periods         = 1
  period                    = 300
  alarms_email              =  ["anupama.s@imimobile.com","manideep.g@imimobile.com"]
  statistic                =  "Average"
  add_sns_policy             = "false"
  TunnelStatethreshold        = 1
  vpnid                       = ["vpn-089106bd7dd600cf9"]
  }

```

### NOTE : you can update the RHS values of variables in the above example WRT region where you are going to deploy CloudWatch alerts.


