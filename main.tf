resource "azurerm_resource_group" "lab" {
  name     = "rg-terraform-lab"
  location = "southcentralus"
}

resource "azurerm_storage_account" "app" {
  name                          = "stlabapp${random_integer.suffix.result}"
  resource_group_name           = azurerm_resource_group.lab.name
  location                      = azurerm_resource_group.lab.location
  account_tier                  = "Standard"
  account_replication_type      = "LRS"
  min_tls_version               = "TLS1_2"
  allow_nested_items_to_be_public = true
  public_network_access_enabled = true

  tags = {
    environment = "lab"
    managed_by  = "terraform"
  }
}

resource "random_integer" "suffix" {
  min = 10000
  max = 99999
}