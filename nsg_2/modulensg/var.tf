variable "networks" {
  type        = any
  description = "(optional) describe your variable"

}


variable "default_rules" {
  type        = any
  description = "(optional) describe your variable"
  default = {
    nsg_name            = "rule-default"
    priority            = "1200"
    direction           = "Inbound"
    access              = "Allow"
    protocol            = "Tcp"
    source_port         = "*"
    destination_port    = "*"
    source_address      = "*"
    destination_address = "*"
  }
}