## Resource Groups

resource_group_info = [
  {
    name     = "rg-dev-hub-001"
    location = "eastus"
    tags = {
      environment = "dev"
      project     = "demo-001"
    }
  },
  {
    name     = "rg-dev-spoke-001"
    location = "eastus"
    tags = {
      environment = "dev"
      project     = "demo-001"
    }
  }
]

## Virtual Networks

virtual_network_info = [
  {
    name                = "vnet-dev-hub-001"
    resource_group_name = "rg-dev-hub-001"
    address_space       = ["10.1.0.0/16"]
    tags = {
      environment = "dev"
      project     = "demo-001"
    }
  },
  {
    name                = "vnet-dev-spoke-001"
    resource_group_name = "rg-dev-spoke-001"
    address_space       = ["10.2.0.0/16"]
    tags = {
      environment = "dev"
      project     = "demo-001"
    }
  }
]

## Subnets and NSG Rules

subnet_info = [
  {
    name                 = "subnet-hub-fw-001"
    virtual_network_name = "vnet-dev-hub-001"
    address_space        = ["10.1.1.0/24"]
    location             = "eastus"
    nsg_rules = [
      {
        name                       = "Allow-Inbound-Internal-Traffic"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },

    ]
    tags = {
      environment = "dev"
      project     = "demo-001"
    }
  },
  {
    name                 = "subnet-web-tier-001"
    virtual_network_name = "vnet-dev-spoke-001"
    address_space        = ["10.2.1.0/24"]
    location             = "eastus"
    nsg_rules = [
      {
        name                       = "Allow-RDP-Inbound"
        priority                   = 200
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3389"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Allow-Inbound-Internal-Traffic"
        priority                   = 201
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }

    ]
    tags = {
      environment = "dev"
      project     = "demo-001"
    }
  },
  {
    name                 = "subnet-ent-tier-001"
    virtual_network_name = "vnet-dev-spoke-001"
    address_space        = ["10.2.2.0/24"]
    location             = "eastus"
    nsg_rules = [
      {
        name                       = "Allow-RDP-Inbound"
        priority                   = 300
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3389"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Allow-Inbound-Internal-Traffic"
        priority                   = 301
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }

    ]
    tags = {
      environment = "dev"
      project     = "demo-001"
    }
  },
  {
    name                 = "subnet-pvendpoint-001"
    virtual_network_name = "vnet-dev-spoke-001"
    address_space        = ["10.2.3.0/24"]
    location             = "eastus"
    nsg_rules = [
      {
        name                       = "Allow-Inbound-Internal-Traffic"
        priority                   = 400
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }

    ]
    tags = {
      environment = "dev"
      project     = "demo-001"
    }
  },
  {
    name                 = "AzureBastionSubnet"
    virtual_network_name = "vnet-dev-spoke-001"
    address_space        = ["10.2.4.0/24"]
    location             = "eastus"
    tags = {
      environment = "dev"
      project     = "demo-001"
    }
  },
  {
    name                 = "subnet-appgw-001"
    virtual_network_name = "vnet-dev-spoke-001"
    address_space        = ["10.2.5.0/24"]
    location             = "eastus"
    nsg_rules = [
      {
        name                       = "AllowAppgatewayInbound"
        priority                   = 500
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "65200-65535"
        source_address_prefix      = "GatewayManager"
        destination_address_prefix = "*"
      },
      {
        name                       = "AllowAppgatewayOutbound"
        priority                   = 511
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "65200-65535"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "App-GW-Inbound-Https"
        priority                   = 501
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Allow-Inbound-Internal-Traffic"
        priority                   = 502
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
    tags = {
      environment = "dev"
      project     = "demo-001"
    }
  },
  {
    name                 = "subnet-sqlmi-001"
    virtual_network_name = "vnet-dev-spoke-001"
    address_space        = ["10.2.6.0/24"]
    location             = "eastus"
    nsg_rules = [
      {
        name                       = "allow_tds_inbound"
        priority                   = 600
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "1433"
        source_address_prefix      = "VirtualNetwork"
        destination_address_prefix = "*"
      },
      {
        name                       = "Allow-Inbound-Internal-Traffic"
        priority                   = 601
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
    tags = {
      environment = "dev"
      project     = "demo-001"
    }
  }

]

## VNet Peering

vnet_peering_info = [
  {
    name                      = "dev-hub-001-to-dev-spoke-001"
    resource_group_name       = "rg-dev-hub-001"
    virtual_network_name      = "vnet-dev-hub-001"
    remote_virtual_network_id = "vnet-dev-spoke-001"
  },
  {
    name                      = "dev-spoke-001-to-dev-hub-001"
    resource_group_name       = "rg-dev-spoke-001"
    virtual_network_name      = "vnet-dev-spoke-001"
    remote_virtual_network_id = "vnet-dev-hub-001"
  }
]

## Bastion Host

# bastion_host_info = [
#   {
#     name                 = "dev-bastion-host-01"
#     resource_group_name  = "rg-dev-spoke-001"
#     virtual_network_name = "vnet-dev-spoke-001"
#     tags = {
#       environment = "dev"
#       project     = "demo-001"
#     }
#   }
# ]


## Upload to Storage Account

upload_to_storage_account_info = [
  {
    name                     = "sadevspoke0017954"
    resource_group_name      = "rg-dev-spoke-001"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      environment = "dev"
      project     = "demo-001"
    }
  }
]

## Key Vault

keyvault_info = {
  name                = "kv-dev-spoke-0017954"
  resource_group_name = "rg-dev-spoke-001"
  location            = "East US"
  sku_kv              = "standard"
  network_acls = {
    bypass         = "AzureServices"
    default_action = "Allow"
  }
  public_network_access_enabled        = true
  purge_protection_enabled             = false
  key_vault_admin_username_secret_name = "vm-admin-username"
  key_vault_admin_password_secret_name = "vm-admin-password"
  soft_delete_retention_days           = 7
  runner_ip                            = false
}

data_disks = [
  {
    lun          = 2
    disk_size_gb = 128
  }
]

## Windows Virtual Machine

windows_virtual_machine_info = [
  {
    name                        = "vm-dev-tcdw001"
    resource_group_name         = "rg-dev-spoke-001"
    virtual_network_name        = "vnet-dev-spoke-001"
    subnet_name                 = "subnet-web-tier-001"
    vm_size                     = "Standard_B2s"
    admin_username              = "vmadmin"
    private_ip_address          = "10.2.1.5"
    user_assigned_identity_name = "vm-dev-web-001"
    key_vault_info = {
      name                = "kv-dev-spoke-0017954"
      secret_name         = "vm-admin-password"
      resource_group_name = "rg-dev-spoke-001"
    }
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference = {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2022-Datacenter"
      version   = "latest"
    }
    # ext_settings = {
    #   fileUris = [
    #     "https://sadevspoke001.blob.core.windows.net/scripts/ConfigureRemotingForAnsible.ps1"
    #   ]
    #   commandToExecute = "powershell -ExecutionPolicy Unrestricted -File ConfigureRemotingForAnsible.ps1"
    # }
    tags = {
      environment = "dev"
      project     = "demo-001"
    }
  },
  {
    name                        = "vm-dev-tcda001"
    resource_group_name         = "rg-dev-spoke-001"
    virtual_network_name        = "vnet-dev-spoke-001"
    subnet_name                 = "subnet-ent-tier-001"
    vm_size                     = "Standard_B2s"
    admin_username              = "vmadmin"
    private_ip_address          = "10.2.2.5"
    user_assigned_identity_name = "vm-dev-ent-001"
    key_vault_info = {
      name                = "kv-dev-spoke-0017954"
      secret_name         = "vm-admin-password"
      resource_group_name = "rg-dev-spoke-001"
    }
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference = {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2022-Datacenter"
      version   = "latest"
    }
    # ext_settings = {
    #   fileUris = [
    #     "https://sadevspoke001.blob.core.windows.net/scripts/ConfigureRemotingForAnsible.ps1"
    #   ]
    #   commandToExecute = "powershell -ExecutionPolicy Unrestricted -File ConfigureRemotingForAnsible.ps1"
    # }
    tags = {
      environment = "dev"
      project     = "demo-001"
    }
  },
  {
    name                        = "vm-dev-tcdv001"
    resource_group_name         = "rg-dev-spoke-001"
    virtual_network_name        = "vnet-dev-spoke-001"
    subnet_name                 = "subnet-ent-tier-001"
    vm_size                     = "Standard_B2s"
    admin_username              = "vmadmin"
    private_ip_address          = "10.2.2.6"
    user_assigned_identity_name = "vm-dev-ent-002"
    key_vault_info = {
      name                = "kv-dev-spoke-0017954"
      secret_name         = "vm-admin-password"
      resource_group_name = "rg-dev-spoke-001"
    }
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference = {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2022-Datacenter"
      version   = "latest"
    }
    # ext_settings = {
    #   fileUris = [
    #     "https://sadevspoke001.blob.core.windows.net/scripts/ConfigureRemotingForAnsible.ps1"
    #   ]
    #   commandToExecute = "powershell -ExecutionPolicy Unrestricted -File ConfigureRemotingForAnsible.ps1"
    # }
    tags = {
      environment = "dev"
      project     = "demo-001"
    }
  }
]



## Storage Account with Endpoint

storage_account_with_ep_info = [
  {
    name                     = "devlabfileshare017954" #devlabfileshare01
    resource_group_name      = "rg-dev-spoke-001"
    account_kind             = "StorageV2"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    virtual_network_name     = "vnet-dev-spoke-001"
    subnet_name              = "subnet-pvendpoint-001"
    tags = {
      environment = "dev"
      project     = "demo-001"
    }
  }
]

## Private DNS Zone

private_dns_zone_info = [
  {
    name                 = "blob"
    resource_group_name  = "rg-dev-spoke-001"
    virtual_network_name = "vnet-dev-spoke-001"
  },
  {
    name                 = "file"
    resource_group_name  = "rg-dev-spoke-001"
    virtual_network_name = "vnet-dev-spoke-001"
  }
]
#https://learn.microsoft.com/en-us/azure/storage/common/storage-private-endpoints



##