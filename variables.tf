variable "root_id" {
  type    = string
  default = "swo"
}

variable "root_name" {
  type    = string
  default = "SWO"
}

variable "subscription_id_connectivity" {
  description = "The connectivity subscription"
  default     = "0be053a2-e2b4-4952-ba4d-56cbca99a0a0"
}

variable "enable_ddos_protection" {
  description = "ddos protection"
  default     = false
}

variable "primary_location" {
  description = "primary hub"
  default     = "eastasia"
}

variable "secondary_location" {
  description = "secondary hub"
  default     = "eastasia"
}
