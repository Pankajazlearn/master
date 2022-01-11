#-#
#-# Azure Resource Group Naming Convention : rg-[project]-[environment]-[sequence]
#-# Eg: rg-mktgsharepoint-prod-01
#-#     rg-acctlookupsvc-dev-01
#-#

resource_groups = {
  resource_group_1 = {
    name     = "rg-mktgsharepoints-prod-01" 
    location = "westeurope"
    tags = {
      Name            = "rg-mktgsharepoints-prod-01"  # Resource Group Name
      Description     = "Resource group for Sharepoint project"
      Environment     = "dev"
      Project         = "test"
      Owner           = "Sandeep"
      BusinessUnit    = "MAF"
      Confidentiality = "Sensitive"
      OpCo            = "test"
    }
  }
  #  resource_group_2 = {
  #  name     = "[__resource_group_name__]" 
  #  location = "eastus2"
  #  tags = {
  #    Name            = "rg-mktgsharepoints-prod-02"  # Resource Group Name
  #    Description     = "test-rg"
  #    Environment     = "dev"
  #    Project         = "test"
  #    Owner           = "Sandeep"
  #    BusinessUnit    = "MAF"
  #    Confidentiality = "Sensitive"
  #    OpCo            = "test"
  #  }
  #}
}
