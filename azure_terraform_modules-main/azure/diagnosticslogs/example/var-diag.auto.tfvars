#-
#- Provide the target resource ID details for which Diagnostic log to be enabled.
#-
resource_id = "/subscriptions/646497f2-cf94-40d9-9ea0-0bb44fcce127/resourceGroups/test-sandy-rg/providers/Microsoft.DBforMySQL/servers/mysql-testapp-dev"

#-
#- Provide the destination resource Id's where logs should be saved
#- logs_destinations_ids = ["<Storage_account_ID>", "<Log_analytics_workspace_ID>", "<Event_hub_id/authorizationRules/rulename>"]
#- 
logs_destinations_ids = [
    "/subscriptions/646497f2-cf94-40d9-9ea0-0bb44fcce127/resourceGroups/demo-iac-rg/providers/Microsoft.Storage/storageAccounts/azstorageacc01000",
    "/subscriptions/646497f2-cf94-40d9-9ea0-0bb44fcce127/resourceGroups/test-sandy-rg/providers/Microsoft.EventHub/namespaces/testeventhub001/authorizationRules/RootManageSharedAccessKey",
    #"/subscriptions/[__subscription_id__]/resourceGroups/[__storage_account_resource_group_name__]/providers/Microsoft.Storage/storageAccounts/[__storage_account_name__]",
    #"/subscriptions/[__subscription_id__]/resourceGroups/[__log_analytics_resource_group_name__]/microsoft.operationalinsights/workspaces/[__log_analytics_workspace_name]",
    #"/subscriptions/[__subscription_id__]/resourceGroups/[__eventhub_resource_group_name__]/providers/Microsoft.EventHub/namespaces/[__eventhub_name__]/authorizationRules/RootManageSharedAccessKey",
]

log_categories = [
  "MySqlSlowLogs",
  "MySqlAuditLogs",
]

metric_categories = [
  "AllMetrics"
]
