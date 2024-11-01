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
  default     = "cb0a6851-9a44-4974-b524-2e9113de3a80"
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
  default     = "southeastasia"
}
