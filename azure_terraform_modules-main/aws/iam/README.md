# AWS Identity and Access Management (IAM) Terraform module

## Features

 Cross-account access- Define IAM roles using `iam_assumable_role`

## Usage

`iam-assumable-role`:

```hcl
module "iam_assumable_role" {
  source  = "./iam/iam-assumable-role"
  

  trusted_role_arns = [
    "arn:aws:iam::30xxxxxxxxxx:root",
    "arn:aws:iam::80xxxxxxxxxx:user/abc",
  ]

  create_role = true

  role_name         = "custom"
  role_requires_mfa = true

  custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonCognitoReadOnly"
    
  ]
  number_of_custom_role_policy_arns = 1
}
```

`iam-policy`:

```hcl
module "iam_policy" {
  source  = "./iam/iam-policy"
  
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
```

`iam-read-only-policy`:

```hcl
module "iam_read_only_policy" {
  source  = "./iam/iam-read-only-policy"
  
  name        = "example"
  path        = "/"
  description = "My example read-only policy"

  allowed_services = ["rds", "dynamo", "health"]
}
```
