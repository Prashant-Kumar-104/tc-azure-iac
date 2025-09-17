variable "resource_group_info" {
  description = "Information about the resource group"
  type = list(object({
    name     = string
    location = string
    tags     = map(string)
  }))
}

variable "virtual_network_info" {
  description = "Information about the virtual network"
  type = list(object({
    name                = string
    resource_group_name = string
    address_space       = list(string)
    tags                = map(string)
  }))
}

variable "subnet_info" {
  description = "Information about the subnet"
  type = list(object({
    name                 = string
    virtual_network_name = string
    address_space        = list(string)

    location = string

    nsg_rules = optional(list(object({
      name                         = string
      priority                     = number
      direction                    = string
      access                       = string
      protocol                     = string
      source_port_range            = optional(string)
      source_port_ranges           = optional(list(string))
      destination_port_range       = optional(string)
      source_address_prefix        = optional(string)
      source_address_prefixes      = optional(list(string))
      destination_address_prefix   = optional(string)
      destination_address_prefixes = optional(list(string))
      destination_port_ranges      = optional(list(string))
    })))

  }))
}

variable "vnet_peering_info" {
  description = "Information about the virtual network peering"
  type = list(object({
    name                      = string
    resource_group_name       = string
    virtual_network_name      = string
    remote_virtual_network_id = string

  }))
}



variable "upload_to_storage_account_info" {
  description = "Information about the upload to storage account"
  type = list(object({
    name                     = string
    resource_group_name      = string
    account_tier             = string
    account_replication_type = string
    tags                     = map(string)
  }))
}

variable "windows_virtual_machine_info" {
  description = "Information about the Windows virtual machine"
  type = list(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    subnet_name          = string
    private_ip_address   = string
    vm_size              = string
    admin_username       = string
    #admin_password       = string
    user_assigned_identity_name = string
    key_vault_info = object({
      name                = string
      secret_name         = string
      resource_group_name = string
    })
    os_disk = object({
      caching              = string
      storage_account_type = string
    })
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
    # ext_settings = object({
    #   fileUris         = list(string)
    #   commandToExecute = string
    # })
    tags = map(string)
  }))
}

variable "data_disks" {
  description = "(Optional) List of data disks. The Logical Unit Number (LUN) needs to be a unique numeric identifier > 0."
  type = list(object({
    lun                  = number
    disk_size_gb         = string
    caching              = optional(string, "ReadWrite")
    storage_account_type = optional(string, "StandardSSD_LRS")
  }))
  default = []
}



variable "storage_account_with_ep_info" {
  description = "Information about the storage account"
  type = list(object({
    name                     = string
    resource_group_name      = string
    account_kind             = string
    account_tier             = string
    account_replication_type = string
    virtual_network_name     = string
    subnet_name              = string
    tags                     = map(string)
  }))
}

variable "keyvault_info" {
  type = object({
    name                = string
    resource_group_name = string
    location            = string
    sku_kv              = string
    #access_policies                      = var.access_policies
    #role_assignments                     = var.role_assignments
    network_acls = object({
      bypass                     = optional(string, "None")
      default_action             = optional(string, "Deny")
      ip_rules                   = optional(list(string), [])
      virtual_network_subnet_ids = optional(list(string), [])
    })
    runner_ip                            = bool
    public_network_access_enabled        = bool
    purge_protection_enabled             = bool
    key_vault_admin_username_secret_name = string
    key_vault_admin_password_secret_name = string
    soft_delete_retention_days           = number
    # log_analytics_workspace_id = var.log_analytics_workspace_id
    # log_analytics_workspace_enable_logs = var.log_analytics_workspace_enable_logs
    # log_analytics_storage_account_id = var.log_analytics_storage_account_id
  })
}

variable "private_dns_zone_info" {
  description = "Information about the private DNS zone"
  type = list(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
  }))
}


# variable "linux_virtual_machine_info" {
#   description = "Information about the Windows virtual machine"
#   type = list(object({
#     name                 = string
#     resource_group_name  = string
#     virtual_network_name = string
#     subnet_name          = string
#     private_ip_address   = string
#     vm_size              = string
#     admin_username       = string
#     #admin_password       = string
#     key_vault_info = object({
#       name                = string
#       secret_name         = string
#       resource_group_name = string
#     })
#     os_disk = object({
#       caching              = string
#       storage_account_type = string
#     })
#     source_image_reference = object({
#       publisher = string
#       offer     = string
#       sku       = string
#       version   = string
#     })
#     ext_settings = object({
#       fileUris         = list(string)
#       commandToExecute = string
#     })
#     identity = object({
#       resource_group_name         = string
#       user_assigned_identity_name = string
#     })
#     tags = map(string)
#   }))
# }

# variable "bastion_host_info" {
#   description = "Information about the bastion host"
#   type = list(object({
#     name                 = string
#     resource_group_name  = string
#     virtual_network_name = string
#     tags                 = map(string)
#   }))
# }