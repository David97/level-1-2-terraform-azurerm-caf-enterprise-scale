locals {
  configure_connectivity_resources = {
    settings = {
      hub_networks = [
        {
          config = {
            address_space                   = ["10.100.0.0/22"]
            location                        = var.primary_location
            link_to_ddos_proteciton_plan    = var.enable_ddos_protection
            enable_hub_network_mesh_peering = true
          }
        },
        {
          config = {
            address_space                   = ["10.101.0.0/22"]
            location                        = var.secondary_location
            link_to_ddos_proteciton_plan    = var.enable_ddos_protection
            enable_hub_network_mesh_peering = true
          }
        }
      ]
      vwan_hub_networks = []
      link_to_ddos_proteciton_plan = {
        enabled = var.enable_ddos_protection
      }
      dns = {
        enabled = false
      }
    }
    location = var.primary_location
  }
}
