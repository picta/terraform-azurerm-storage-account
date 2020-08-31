terraform {
  required_version = "0.13.1"
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

  dynamic "network_rules" {
    for_each = var.network_rules != null ? ["true"] : []
    content {
      default_action             = "Deny"
      ip_rules                   = var.network_rules.ip_rules
      virtual_network_subnet_ids = var.network_rules.subnet_ids
      bypass                     = var.network_rules.bypass
    }
  }
}
