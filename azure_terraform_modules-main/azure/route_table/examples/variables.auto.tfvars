environment            = "dev"
project                = "example"
owner                  = "example@mail.ae"
business_unit          = "BU"
operational_company    = "OpCo"
location               = "uaenorth"
az_resource_group_name = "test-examples"
az_route_table_name    = "example-route-table"
az_route_table_routes  = [
    {
        name = "route-001",
        address_prefix = "192.0.0.0/32",
        next_hop_type = "VirtualNetworkGateway"
    },
    {
        name = "route-002",
        address_prefix = "192.0.1.0/32",
        next_hop_type = "VnetLocal"
    },
    {
        name = "route-003",
        address_prefix = "192.0.2.0/32",
        next_hop_in_ip_address = "192.0.0.2"
    }
]
