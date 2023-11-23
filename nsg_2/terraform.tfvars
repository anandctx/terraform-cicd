networks = {
  "uksouth" = {
    "apps-01-vnet" = {

      subnets = {
        "vm-01" = {


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
        "pam-01" = {


          rules = {
            "1" = {
              nsg_name            = "test2"
              priority            = "1200"
              direction           = "Inbound"
              access              = "Allow"
              protocol            = "Tcp"
              source_port         = "*"
              destination_port    = "*"
              source_address      = "*"
              destination_address = "*"
            }
            "pam-only-2" = {
              nsg_name            = "pam-only"
              priority            = "1000"
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
        "pexip-01" = {


          rules = {
            "1" = {
              nsg_name            = "test2"
              priority            = "1202"
              direction           = "Inbound"
              access              = "Allow"
              protocol            = "Tcp"
              source_port         = "*"
              destination_port    = "*"
              source_address      = "*"
              destination_address = "*"
            }
            "pexip-only" = {
              nsg_name            = "pexip-only"
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



        }
      }
    }
  }
}

