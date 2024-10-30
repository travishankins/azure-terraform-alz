# main.tf in optional_resources module

# Create a dedicated resource group for optional resources
resource "azurerm_resource_group" "optional_resources" {
  name     = "${var.resource_prefix}-optional-resources-rg"
  location = var.location
}

# Optional Log Analytics Workspace - Production
resource "azurerm_log_analytics_workspace" "prod" {
  count               = var.deploy_log_analytics_workspace ? 1 : 0
  name                = var.log_analytics_workspace_prod_name
  location            = var.location
  resource_group_name = azurerm_resource_group.optional_resources.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

# Optional Log Analytics Workspace - Non-Production
resource "azurerm_log_analytics_workspace" "nonprod" {
  count               = var.deploy_log_analytics_workspace ? 1 : 0
  name                = var.log_analytics_workspace_nonprod_name
  location            = var.location
  resource_group_name = azurerm_resource_group.optional_resources.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

# Optional Azure Automation Account
resource "azurerm_automation_account" "management" {
  count               = var.deploy_automation_account ? 1 : 0
  name                = "${var.resource_prefix}-automation-account"
  location            = var.location
  resource_group_name = azurerm_resource_group.optional_resources.name
  sku_name            = "Basic"
  depends_on          = [azurerm_log_analytics_workspace.prod, azurerm_log_analytics_workspace.nonprod]
}

# Optional Data Collection Rule
resource "azurerm_monitor_data_collection_rule" "data_collection_rule" {
  count               = var.deploy_data_collection_rules ? 1 : 0
  name                = "${var.resource_prefix}-data-collection-rule"
  location            = var.location
  resource_group_name = azurerm_resource_group.optional_resources.name

  destinations {
    log_analytics {
      name                  = "log_analytics_destination"
      workspace_resource_id = azurerm_log_analytics_workspace.prod[0].id
    }
  }

  data_sources {
    windows_event_log {
      name             = "windows_event_log_data"
      streams          = ["Microsoft-Windows-Security-Auditing"]
      x_path_queries   = ["Security"]  # Corrected attribute
    }

    performance_counter {
      name                           = "performance_counter_data"
      streams                        = ["Microsoft-Windows-Disk-IO"]
      counter_specifiers             = ["\\PhysicalDisk(_Total)\\Disk Write Bytes/sec"]
      sampling_frequency_in_seconds  = 60
    }
  }

  data_flow {
    streams      = ["Microsoft-Windows-Security-Auditing", "Microsoft-Windows-Disk-IO"]
    destinations = ["log_analytics_destination"]
  }
}

# Optional User Assigned Managed Identity
resource "azurerm_user_assigned_identity" "managed_identity" {
  count               = var.deploy_managed_identity ? 1 : 0
  name                = "${var.resource_prefix}-managed-identity"
  location            = var.location
  resource_group_name = azurerm_resource_group.optional_resources.name
}
