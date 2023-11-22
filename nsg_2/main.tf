module "nsg" {
  source   = "./modulensg"
  for_each = var.networks
  networks = each.value

}