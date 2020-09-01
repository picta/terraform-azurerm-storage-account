terraform {
  required_version = "0.14.1"
}

provider "azurerm" {
  version = "=2.20.0"
  features {}
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "${var.storage_account_name}"
  location                 = "${var.location}"
  account_tier             = "${var.storage_account_tier}"
  resource_group_name      = "${var.resource_group_name}"
  account_replication_type = "${var.storage_account_replication_type}"
}
