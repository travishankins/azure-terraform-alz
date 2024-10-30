# outputs.tf in optional_resources module

output "management_resource_group_name" {
  value = azurerm_resource_group.optional_resources.name
  description = "Name of the resource group created for optional resources"
}
