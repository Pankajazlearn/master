provider "azurerm" {
  features {}
}

#--------------------------------
# Pre-existing Eventhub Namespace
#--------------------------------

data "azurerm_eventhub_namespace" "az_eventhub_namespace" {
  count               = var.create_eventhub_namespace ? 0 : 1
  name                = var.az_eventhub_namespace_name
  resource_group_name = var.az_resource_group_name
}


#-------------------------------------------------
# Eventhub Namespace creation - Default is "false"
#-------------------------------------------------

resource "azurerm_eventhub_namespace" "az_eventhub_namespace" {
  count               = var.create_eventhub_namespace ? 1 : 0
  name                = "evhns-${var.operational_company}-${var.location_abbreviation}-${var.az_eventhub_namespace_sequence}"
  location            = "${var.location}"
  resource_group_name = var.az_resource_group_name
  sku                 = var.az_eventhub_namespace_sku
  capacity            = var.az_eventhub_namespace_capacity

  tags = merge(
      local.common_tags,
       {
            Name        = "evhns-${var.operational_company}-${var.location_abbreviation}-${var.az_eventhub_namespace_sequence}",
            Description = "Eventhub namespace is created in ${var.location_abbreviation} region."
       }
  )
}

#-------------------
# Eventhub Creation
#-------------------

resource "azurerm_eventhub" "az_eventhub" {
  name                = "ehub-${var.operational_company}-${var.application_name}-${var.az_eventhub_sequence}"
  namespace_name      = local.az_eventhub_namespace_name
  resource_group_name = var.az_resource_group_name
  partition_count     = var.az_eventhub_partition_count
  message_retention   = var.az_eventhub_message_retention
}
