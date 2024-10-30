terraform {
  required_version = ">= 1.1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.107.0"
    }
  }

  cloud {
    # The name of your Terraform Cloud organization.
    organization = "SoftwareOne"

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "level-1-2-terraform-azurerm-caf-enterprise-scale"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_client_config" "core" {}


module "enterprise_scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "6.1.0"

  default_location = "eastasia"

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  root_parent_id = data.azurerm_client_config.core.tenant_id
  root_id        = var.root_id
  root_name      = var.root_name
  # library_path   = "${path.root}/lib"

  ### all bool possibilities ###
  deploy_core_landing_zones   = true  // deploy 386 resources
  deploy_corp_landing_zones   = false // just 1 azurerm subscription template deployment replaced
  deploy_online_landing_zones = false // just 1 azurerm subscription template deployment replaced
  deploy_sap_landing_zones    = false // no change
  deploy_demo_landing_zones   = false // no change

  deploy_management_resources   = false // Tested -- Log Analytics workspaces -- cannot all apply
  deploy_diagnostics_for_mg     = false // Tested -- nothing deployed
  deploy_identity_resources     = false // Tested -- nothing deployed
  deploy_connectivity_resources = true  // Tested -- 77 private_dns_zone (98%), 1 resource group (1%), 1 azurerm_subscription_template_deployment (1%)

  disable_base_module_tags                      = false // nothing to deploy, just to remove all the tags
  disable_telemetry                             = false // just to destroy 3 telemetry resources
  strict_subscription_association               = false // no change
  policy_non_compliance_message_enabled         = false // no change
  policy_non_compliance_message_default_enabled = false // no change

  # custom_landing_zones = {
  #   "${var.root_id}-online-example-1" = {
  #     display_name               = "${upper(var.root_id)} Online Example 1"
  #     parent_management_group_id = "${var.root_id}-landing-zones"
  #     subscription_ids           = []
  #     archetype_config = {
  #       archetype_id   = "customer_online"
  #       parameters     = {}
  #       access_control = {}
  #     }
  #   }
  #   "${var.root_id}-online-example-2" = {
  #     display_name               = "${upper(var.root_id)} Online Example 2"
  #     parent_management_group_id = "${var.root_id}-landing-zones"
  #     subscription_ids           = []
  #     archetype_config = {
  #       archetype_id = "customer_online"
  #       parameters = {
  #         Deny-Resource-Locations = {
  #           listOfAllowedLocations = ["eastasia", ]
  #         }
  #         Deny-RSG-Locations = {
  #           listOfAllowedLocations = ["eastasia", ]
  #         }
  #       }
  #       access_control = {}
  #     }
  #   }
  # }
}


