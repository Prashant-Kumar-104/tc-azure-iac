resource "azurerm_public_ip" "publicip" {
  name                = "pip-${var.name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"   #"Dynamic"
  sku                 = "Standard" #Basic
  tags                = var.tags
}

resource "azurerm_bastion_host" "bastion" {
  name                = "host-${var.name}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                 = "ipconfig-${var.name}"
    subnet_id            = data.azurerm_subnet.subnetinfo.id
    public_ip_address_id = azurerm_public_ip.publicip.id
  }
  tags = var.tags
}