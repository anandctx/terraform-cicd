networks = {
  "uksouth" = {
    "apps-02-vnet" = {

      subnets = {
        "mysub1-01" = {


          rules = {
            "1" = {
              nsg_name            = "test2"
              priority            = "1100"
              direction           = "Inbound"
              access              = "Allow"
              protocol            = "Tcp"
              source_port         = "*"
              destination_port    = "*"
              source_address      = "*"
              destination_address = "*"
            }



          }


        }
  
      }
    }
  }
}
