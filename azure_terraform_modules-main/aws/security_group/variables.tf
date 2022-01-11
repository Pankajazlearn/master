
variable "aws_region" {
  description = "Provide the name of the region in which the resources need to be provisioned"
  type        = string
}

variable "project" {
  description = "Provide the project name code of the Business Unit under which the resources are provisioned"
  type        = string
}

variable "environment" {
  description = "Provide the environment name under the resources are provisioned"
  type        = string
}

variable "business_unit" {
  description = "The business unit in which the resources are provisioned"
  type        = string
}

variable "owner" {
  description = "The owner of the resources are provisioned"
  type        = string
}

variable "operational_company" {
  description = "Provide the Operational Company name under which the resources are provisioned"
  type 	      = string
}

variable "aws_security_group_ingress" {
  description = "Provide the security group ingress range under which the resources are provisioned"
  default = [
    {
      self        = false
      cidr_blocks = ["10.140.6.197/32"]
      description = "Qualys-001"
      from_port   = 0
      to_port     = 0
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["10.140.1.104/32"]
      description = "Qradar-001"
      from_port   = 514
      to_port     = 514
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["10.140.1.196/32"]
      description = "Qradar-002"
      from_port   = 514
      to_port     = 514
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["10.140.1.166/32"]
      description = "BMC Monitoring"
      from_port   = 0
      to_port     = 0
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["10.140.1.106/32"]
      description = "F5-001"
      from_port   = 0
      to_port     = 0
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["10.143.5.125/32"]
      description = "F5-002"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["10.143.5.125/32"]
      description = "F5-002"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
    },


    {
      self        = false
      cidr_blocks = ["10.143.5.74/32"]
      description = "F5-003"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["10.143.5.74/32"]
      description = "F5-003"
      from_port   = 444
      to_port     = 444
      protocol    = "tcp"
    },


    {
      self        = false
      cidr_blocks = ["10.143.7.100/32"]
      description = "F5-004"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["10.143.7.100/32"]
      description = "F5-004"
      from_port   = 445
      to_port     = 445
      protocol    = "tcp"
    },


    {
      self        = false
      cidr_blocks = ["10.143.7.132/32"]
      description = "F5-005"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["10.143.7.132/32"]
      description = "F5-005"
      from_port   = 446
      to_port     = 446
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["10.143.7.165/32"]
      description = "F5-006"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["10.143.7.165/32"]
      description = "F5-006"
      from_port   = 447
      to_port     = 447
      protocol    = "tcp"
    },


    {
      self        = false
      cidr_blocks = ["172.31.201.196/32"]
      description = "Heat Patch Server-001"
      from_port   = 137
      to_port     = 137
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["172.31.201.196/32"]
      description = "Heat Patch Server-001"
      from_port   = 139
      to_port     = 139
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["172.31.201.196/32"]
      description = "Heat Patch Server-001"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["172.31.201.196/32"]
      description = "Heat Patch Server-001"
      from_port   = 445
      to_port     = 445
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["172.31.201.196/32"]
      description = "Heat Patch Server-001"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
    },


    {
      self        = false
      cidr_blocks = ["10.110.110.112/32"]
      description = "Kaspersky-001"
      from_port   = 14000
      to_port     = 14000
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["52.29.174.42/32"]
      description = "Fireeye-001"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["52.29.174.42/32"]
      description = "Fireeye-001"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
    },


    {
      self        = false
      cidr_blocks = ["10.143.0.25/32"]
      description = "jb.maf.ae(windows)-001"
      from_port   = 3389
      to_port     = 3389
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["10.143.16.25/32"]
      description = "jb.maf.ae(windows)-002"
      from_port   = 3389
      to_port     = 3389
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["10.143.0.53/32"]
      description = "jb.maf.ae(Linux)-001"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["10.143.16.44/32"]
      description = "jb.maf.ae(Linux)-002"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["10.110.110.130/32"]
      description = "on-prem-jump-server-001"
      from_port   = 3389
      to_port     = 3389
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["10.110.110.120/32"]
      description = "on-prem-jump-server-002"
      from_port   = 3389
      to_port     = 3389
      protocol    = "tcp"
    },
  ]
}

variable "aws_security_group_egress" {
  description = "Provide the security group egress range under which the resources are provisioned"
  default = [
    {
      self        = false
      cidr_blocks = ["172.31.201.11/32"]
      description = "On-prem-domain-controller-001"
      from_port   = 53
      to_port     = 53
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["172.31.201.11/32"]
      description = "On-prem-domain-controller-001"
      from_port   = 88
      to_port     = 88
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["172.31.201.11/32"]
      description = "On-prem-domain-controller-001"
      from_port   = 389
      to_port     = 389
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["172.31.201.11/32"]
      description = "On-prem-domain-controller-001"
      from_port   = 636
      to_port     = 636
      protocol    = "tcp"
    },


    {
      self        = false
      cidr_blocks = ["172.31.201.12/32"]
      description = "On-prem-domain-controller-002"
      from_port   = 53
      to_port     = 53
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["172.31.201.12/32"]
      description = "On-prem-domain-controller-002"
      from_port   = 88
      to_port     = 88
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["172.31.201.12/32"]
      description = "On-prem-domain-controller-002"
      from_port   = 389
      to_port     = 389
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["172.31.201.12/32"]
      description = "On-prem-domain-controller-002"
      from_port   = 636
      to_port     = 636
      protocol    = "tcp"
    },


    {
      self        = false
      cidr_blocks = ["10.140.6.17/32"]
      description = "AWS-Properties-domain-controller-001"
      from_port   = 53
      to_port     = 53
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["10.140.6.17/32"]
      description = "AWS-Properties-domain-controller-001"
      from_port   = 88
      to_port     = 88
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["10.140.6.17/32"]
      description = "AWS-Properties-domain-controller-001"
      from_port   = 389
      to_port     = 389
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["10.140.6.17/32"]
      description = "AWS-Properties-domain-controller-001"
      from_port   = 636
      to_port     = 636
      protocol    = "tcp"
    },


    {
      self        = false
      cidr_blocks = ["10.143.16.10/32"]
      description = "AWS-Infra-domain-controller-001"
      from_port   = 53
      to_port     = 53
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["10.143.16.10/32"]
      description = "AWS-Infra-domain-controller-001"
      from_port   = 88
      to_port     = 88
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["10.143.16.10/32"]
      description = "AWS-Infra-domain-controller-001"
      from_port   = 389
      to_port     = 389
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["10.143.16.10/32"]
      description = "AWS-Infra-domain-controller-001"
      from_port   = 636
      to_port     = 636
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["10.143.0.10/32"]
      description = "AWS-Infra-domain-controller-002"
      from_port   = 53
      to_port     = 53
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["10.143.0.10/32"]
      description = "AWS-Infra-domain-controller-002"
      from_port   = 88
      to_port     = 88
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["10.143.0.10/32"]
      description = "AWS-Infra-domain-controller-002"
      from_port   = 389
      to_port     = 389
      protocol    = "tcp"
    },

    {
      self        = false
      cidr_blocks = ["10.143.0.10/32"]
      description = "AWS-Infra-domain-controller-002"
      from_port   = 636
      to_port     = 636
      protocol    = "tcp"
    },
  ]
}


variable "aws_vpc_id" {
  description = "Provide the VPC ID under which the resources are provisioned"
  type        = string
  default     = ""
}

variable "sequence_of_security_group" {
  description = "Resource counter"
  type        = number
  default     = 1
}
