terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "random_integer" "ri" {
  min = 1
  max = 50000
}

resource "azurerm_resource_group" "arg" {
  name     = "contactbookapp-rg${random_integer.ri.result}"
  location = "Italy North"
}

resource "azurerm_service_plan" "asp" {
  name                = "contactbookappsp"
  resource_group_name = azurerm_resource_group.arg.name
  location            = azurerm_resource_group.arg.location
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_linux_web_app" "alwa" {
  name                = "contactbookappalwa"
  resource_group_name = azurerm_resource_group.arg.name
  location            = azurerm_resource_group.arg.location
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {
    application_stack {
      node_version = "16-lts"
    }
    always_on = false
  }
}

resource "azurerm_app_service_source_control" "aassc" {
  app_id                 = azurerm_linux_web_app.alwa.id
  repo_url               = "https://github.com/KrumYakimov/ContactBook-NodeJS-App"
  branch                 = "main"
  use_manual_integration = true
}

