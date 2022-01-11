provider "aws" {
  region = "eu-west-1"
}

###############################
# IAM assumable role for admin
###############################
module "iam_assumable_role_admin" {
  source = "../../iam-assumable-role"
  project             = "temp"
  environment         = "sandbox"
  business_unit       = "maf"
  owner               = "dev"
  operational_company = "prop"
  confidentiality     = "internal"
  technical_owner     = "sandbox"
  trusted_role_arns = [
    "arn:aws:iam::30xxxxxxxxxx:root",
    "arn:aws:iam::80xxxxxxxxxx:user/abc",
  ]

  trusted_role_services = [
    "codedeploy.amazonaws.com"
  ]

  create_instance_profile = true

  role_name         = "admin"
  role_requires_mfa = true

  attach_admin_policy = true


}

##########################################
# IAM assumable role with custom policies
##########################################
module "iam_assumable_role_custom" {
  source = "../../iam-assumable-role"
  project             = "temp"
  environment         = "sandbox"
  business_unit       = "maf"
  owner               = "dev"
  operational_company = "prop"
  confidentiality     = "internal"
  technical_owner     = "sandbox"
  trusted_role_arns = [
     "arn:aws:iam::30xxxxxxxxxx:root"
    
  ]

  trusted_role_services = [
    "codedeploy.amazonaws.com"
  ]

  role_name         = "custom"
  role_requires_mfa = false

  role_sts_externalid = "some-id-goes-here"

  custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonCognitoReadOnly",
    "arn:aws:iam::aws:policy/AlexaForBusinessFullAccess",
    module.iam_policy.arn
  ]
  number_of_custom_role_policy_arns = 3
}

####################################################
# IAM assumable role with multiple sts external ids
####################################################
module "iam_assumable_role_sts" {
  source = "../../iam-assumable-role"
  project             = "temp"
  environment         = "sandbox"
  business_unit       = "maf"
  owner               = "dev"
  operational_company = "prop"
  confidentiality     = "internal"
  technical_owner     = "sandbox"
  trusted_role_arns = [
    "arn:aws:iam::30xxxxxxxxxx:root"
  
  ]

  trusted_role_services = [
    "codedeploy.amazonaws.com"
  ]

  create_role = true

  role_name         = "custom_sts"
  role_requires_mfa = true

  role_sts_externalid = [
    "some-id-goes-here",
    "another-id-goes-here",
  ]

  custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonCognitoReadOnly",
    "arn:aws:iam::aws:policy/AlexaForBusinessFullAccess",
    module.iam_policy.arn
  ]
    number_of_custom_role_policy_arns = 3
}

#########################################
# IAM policy
#########################################
module "iam_policy" {
  source = "../../iam-policy"
  project             = "temp"
  environment         = "sandbox"
  business_unit       = "maf"
  owner               = "dev"
  operational_company = "prop"
  confidentiality     = "internal"
  technical_owner     = "sandbox"
  name        = "example"
  path        = "/"
  description = "My example policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
