resource "azurerm_resource_group" "my_terraform_resource_group" {
  name     = "NewTerraformRG"
  location = "West Europe"
}

resource "azurerm_container_group" "myContainerGroup" {
  name                = "mycontainergroupforcop"
  location            = azurerm_resource_group.my_terraform_resource_group.location
  resource_group_name = azurerm_resource_group.my_terraform_resource_group.name

  os_type = "Linux"

  container {
    name   = "mycontainerforcop"
    image  = "nginx"
    cpu    = "1.0"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }
  }
}
