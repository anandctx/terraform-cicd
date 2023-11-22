resource "azurerm_network_security_group" "example" {
  for_each = { for k, v in local.subnets_by_vnet : k => v }
  name     = "nsg-${each.value.subnet_name}"
  # name = local.abc[each.value.vnet_name].tags!= null?"nsg-${local.abc[each.value.vnet_name].name}":each.value.vnet_name
  location            = "uksouth"
  resource_group_name = "ibo-rg"

  # dynamic "security_rule" {
  #   # for_each = [1]
  #   for_each = length(regexall(".*pam*", each.value.subnet_name)) > 0 ? [1] : []

  #   # content {
  #   #   name                       = try(each.value.default_rules["pam"].nsg_name, each.value.rules.pam.nsg_name)
  #   #   priority                   = try(each.value.default_rules["pam"].priority, "1000")
  #   #   direction                  = try(each.value.default_rules["pam"].direction, "Inbound")
  #   #   access                     = try(each.value.default_rules["pam"].access, "Allow")
  #   #   protocol                   = try(each.value.default_rules["pam"].protocol, "Tcp")
  #   #   source_port_range          = try(each.value.default_rules["pam"].source_port, "*")
  #   #   destination_port_range     = try(each.value.default_rules["pam"].destination_port, "*")
  #   #   source_address_prefix      = try(each.value.default_rules["pam"].source_address, "*")
  #   #   destination_address_prefix = try( each.value.default_rules["pam"].destination_address,"*")
  #   # }

  #   content {
  #     name                       = try("pam-only")
  #     priority                   = try("1000")
  #     direction                  = try("Inbound")
  #     access                     = try( "Allow")
  #     protocol                   = try( "Tcp")
  #     source_port_range          = try( "*")
  #     destination_port_range     = try( "*")
  #     source_address_prefix      = try( "*")
  #     destination_address_prefix = try( "*")
  #   }


  # }
  # dynamic "security_rule" {
  #   # for_each = [1]
  #   # for_each = length(regexall(".*pam*", each.value.subnet_name)) > 0 ? [1] : [0]
  #   for_each = try( [for a in each.value.rulesabc:a], [])

  #   content {
  #     name                       = security_rule.value
  #     priority                   =  "1000"
  #     direction                  =  "Inbound"
  #     access                     =  "Allow"
  #     protocol                   =  "Tcp"
  #     source_port_range          = "*"
  #     destination_port_range     =  "*"
  #     source_address_prefix      =  "*"
  #     destination_address_prefix = "*"
  #   }


  # }


  # dynamic "security_rule" {
  #   # for_each = [1]
  #   # for_each = length(regexall(".*pexip*", each.value.subnet_name)) >0 &&each.value.pexip!=null ? [1] : []
  #   for_each = length(regexall(".*pexip*", each.value.subnet_name)) > 0 ? [1] : []

  #   content {
  #     name                       = try( "pexip-only")
  #     priority                   = try( "1200")
  #     direction                  = try("Inbound")
  #     access                     = try( "Allow")
  #     protocol                   = try("Tcp")
  #     source_port_range          = try("*")
  #     destination_port_range     = try("*")
  #     source_address_prefix      = try( "*")
  #     destination_address_prefix = try( "*")
  #   }


  # }
  # dynamic "security_rule" {
  #   for_each = length(regexall(".*AzureBastionSubnet*", each.key)) == 0 && length(regexall(".*GatewaySubnet*", each.key)) == 0 ? [1] : []
  #   content {
  #     name                       = try(each.value.deny_inbound.nsg_name, "Deny_Inbound")
  #     priority                   = try(each.value.deny_inbound.priority, "4096")
  #     direction                  = try(each.value.deny_inbound.direction, "Inbound")
  #     access                     = try(each.value.deny_inbound.access, "Deny")
  #     protocol                   = try(each.value.deny_inbound.protocol, "*")
  #     source_port_range          = try(each.value.deny_inbound.source_port, "*")
  #     destination_port_range     = try(each.value.deny_inbound.destination_address, "*")
  #     source_address_prefix      = try(each.value.deny_inbound.source_address, "*")
  #     destination_address_prefix = try(each.value.deny_inbound.destination_address, "*")
  #   }


  # }
  # dynamic "security_rule" {
  #   for_each = length(regexall(".*AzureBastionSubnet*", each.key)) == 0 && length(regexall(".*GatewaySubnet*", each.key)) == 0 && length(regexall(".*pexip*", each.key)) == 0? [1] : []
  #   content {
  #     name                       = try(each.value.intra_subnet.nsg_name, "AllowIntraSubnet")
  #     priority                   = try(each.value.intra_subnet.priority, "4080")
  #     direction                  = try(each.value.intra_subnet.direction, "Inbound")
  #     access                     = try(each.value.intra_subnet.access, "Allow")
  #     protocol                   = try(each.value.intra_subnet.protocol, "*")
  #     source_port_range          = try(each.value.intra_subnet.source_port, "*")
  #     destination_port_range     = try(each.value.intra_subnet.destination_address, "*")
  #     source_address_prefix      = try(each.value.address_prefix, "*")
  #     destination_address_prefix = try(each.value.address_prefix, "*")
  #   }


  # }

  dynamic "security_rule" {
    for_each = each.value.rules
    content {
      name                       = security_rule.value.nsg_name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port
      destination_port_range     = security_rule.value.destination_port
      source_address_prefix      = security_rule.value.source_address
      destination_address_prefix = security_rule.value.destination_address
    }


  }
  tags = {
    "a" = "a"
  }

  lifecycle {
    ignore_changes = [tags["b"]]
  }


}



