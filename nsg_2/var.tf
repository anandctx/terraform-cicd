variable "networks" {
  #   type        = any
  description = "(optional) describe your variable"


  type = map( # In the outer map we expect the location, for example uksouth)
    map(      # In the inner map we expect the network name (i.e, my-application)
      object({

        subnets = map(
          object({
            # pam_default = optional(object({
            #   nsg_name            = optional(string)
            #   priority            = optional(string)
            #   direction           = optional(string)
            #   access              = optional(string)
            #   protocol            = optional(string)
            #   source_port         = optional(string)
            #   destination_port    = optional(string)
            #   source_address      = optional(string)
            #   destination_address = optional(string)


            # }))
            # deny_inbound = optional(object({
            #   nsg_name            = optional(string)
            #   priority            = optional(string)
            #   direction           = optional(string)
            #   access              = optional(string)
            #   protocol            = optional(string)
            #   source_port         = optional(string)
            #   destination_port    = optional(string)
            #   source_address      = optional(string)
            #   destination_address = optional(string)


            # }))
            # intra_subnet = optional(object({
            #   nsg_name            = optional(string)
            #   priority            = optional(string)
            #   direction           = optional(string)
            #   access              = optional(string)
            #   protocol            = optional(string)
            #   source_port         = optional(string)
            #   destination_port    = optional(string)
            #   source_address      = optional(string)
            #   destination_address = optional(string)


            # }))
            rules = map(object({
              nsg_name            = string
              priority            = string
              direction           = string
              access              = string
              protocol            = string
              source_port         = string
              destination_port    = string
              source_address      = string
              destination_address = string
            }))
            # rulesabc = optional(list(string))
            # default_rules = optional(map(object({
            #   nsg_name            = string
            #   priority            = string
            #   direction           = string
            #   access              = string
            #   protocol            = string
            #   source_port         = string
            #   destination_port    = string
            #   source_address      = string
            #   destination_address = string
            # })))




          })
        )

      })
    )
  )

}