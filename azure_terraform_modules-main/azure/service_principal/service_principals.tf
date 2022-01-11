#------------------------------------------------
# Data source for Service Principal
#-----------------------------------------------

data "azuread_service_principal" "az_service_principal" {
  count        = var.create_service_principal ? 0 : 1
  display_name = var.existing_service_principal
}

#------------------------------------------------
# Data source for Client Configurations
#------------------------------------------------

data "azuread_client_config" "az_client_config" {}

#------------------------------------------------
# Azure Active Directory Application Creation
#------------------------------------------------

resource "azuread_application" "az_read_application" {
  count        = var.create_service_principal ? 1 : 0
  display_name = var.application_name
  owners       = [data.azuread_client_config.az_client_config.object_id]
}

#--------------------------------------------------
# Azure Active Directory Service Principal Creation
#--------------------------------------------------

resource "azuread_service_principal" "az_service_principal" {
  count                        = var.create_service_principal ? 1 : 0
  application_id               = azuread_application.az_read_application[count.index].application_id
  app_role_assignment_required = true
  owners                       = [data.azuread_client_config.az_client_config.object_id]

}

#-------------------------------------------------
# Data source for Azure Subscription
#-------------------------------------------------

data "azurerm_subscription" "az_subscription" {
}

#-------------------------------------------------
# Data source for Client Configurations
#-------------------------------------------------

data "azurerm_client_config" "az_client_config" {
}

#----------------------------------------------------
# Azure Role Assignment for the Service Principal
#----------------------------------------------------

resource "azurerm_role_assignment" "az_role_assignment" {
  scope                = data.azurerm_subscription.az_subscription.id
  role_definition_name = var.role_definition_name
  principal_id         = data.azurerm_client_config.az_client_config.object_id

  depends_on = [
    azuread_service_principal.az_service_principal
  ]
}
