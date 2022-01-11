locals {
  SQS_name = "sqs-${var.SQS_name.environment}-${var.SQS_name.region}"
  user     = data.aws_caller_identity.current.arn

}

data "aws_caller_identity" "current" {}

module "SQS" {
  source = "../"

  name              = local.SQS_name
  kms_master_key_id = "alias/aws/sqs"
  policy = [
    {
      effect     = "Allow"
      actions    = ["SQS:SendMessage", "SQS:ReceiveMessage"]
      principals = [local.user]
    }
    ,
    {
      ## I added same user, it should be different one. 
      effect     = "Allow"
      actions    = ["SQS:ReceiveMessage"]
      principals = [local.user]


    }
  ]
  tag_Environment     = "sandbox"
  tag_Project         = "POC"
  tag_Owner           = "menna.ammar@gmail.com"
  tag_BusinessUnit    = "AA"
  tag_OpCo            = "mafp"
  tag_Confidentiality = "Internal"

}
