locals {
  subnet_list = flatten([
    for network_name, network in var.networks : [
      for subnet_name, subnet in network.subnets : merge(subnet, {
        subnet_name = subnet_name
        vnet_name   = network_name
        rules       = subnet.rules
        # pam_default   = subnet.pam_default
        pexip = try(subnet.default_rules["pexip"], null)
        # default_rules = subnet.default_rules
      })
    ]
  ])

  subnets_by_vnet = {
    for subnet in local.subnet_list : "${subnet.vnet_name}-${subnet.subnet_name}" => subnet
  }
  # nsgname = for


}