# Create Load balancers in Azure

This module allows you to create load balancer in Azure.

## Features

1. Create private load balancers in an existing resource group.
2. Add frontend ip's to load balancer.
3. Create multiple inbound NAT rules and outbound rules on load balancer.
4. Create NAT pools for VMSS workloads.

## usage

```
- name: loadbalancer
  type: loadbalancer
  dependencies:
    networking: vnet, subnet, network interfaces
```

## Example

Please refer Example directory to consume this module into your application.

- [var-loadbalancer.auto.tfvars](./var-loadbalancer.auto.tfvars) contains the variable defination or actual values for respective variables which are passed to the Load balancer module.

## Best practices for variable declarations

1.  All names of the Resources should be defined as per standard naming conventions.
2.  While declaring variables with data type 'map(object)'. It's mandatory to define all the objects.If you don't want to use any specific objects define it as null or empty list as per the object data type.

    - for example:

    ```hcl
     variable "example" {
       type = map(object({
         name         = string
         permissions  = list(string)
         cmk_enable   = bool
         auto_scaling = string
     }))
    ```

    - In above example, if you don't want to use the objects permissions and auto_scaling, you can define it as below.

    ```hcl
     example = {
       name         = "example"
       permissions  = []
       cmk_enable   = true
       auto_scaling = null
     }
    ```

3.  Please make sure all the Required parameters are declared.Refer below section to understand the required and optional parameters of this layer.

4.  Please verify that the values provided to the variables are with in the allowed values.Refer below section to understand the allowed values to each parameter.

## Inputs

### **Required Parameters**

These variables must be set in the `/var-loadbalancer.auto.tfvars` file when using this module.

#### resource_group_name `string`

    The name of the resource group in which the Load balancer will be created.


#### location `string`
    
    Location details in which to create the Load Balancer.

#### vnet_resource_group_name `string`
    
    The name of the Virtual Network Resource Group.

#### nic_resource_group_name `string`
  
  The name of the Network Interface Resource Group.

#### load_balancer_name `string`

    Load balancer to be created in a particular resource group.

#### load_balancer_sku `string`

    Load balancer SKU

#### frontend_ip_configuration_name `string`

    load balancer frontend IP name.

#### **Optional Parameters**

#### load_balancer_rules `map(object({}))`

    Map of load balancer rules which needs to be created in a load balancer

#### tag_Environment `string`
    
    description = "Loadbalancer tag Environment"

#### tag_Project `string`
  
    description = "Loadbalancer tag Project"

#### tag_Owner `string`
    
    description = "Loadbalancer tag Owner"

### tag_BusinessUnit `string`
  
  description = "Loadbalancer tag BusinessUnit"

### tag_OpCo `string`
    
    description = "Loadbalancer tag OpCo"

### "tag_Confidentiality" `string`
    
    description = "Loadbalancer tag confidentiality"


| Attribute                 | Data Type | Field Type | Description                                                                                                                                                                                                                | Allowed Values                      |
| :------------------------ | :-------: | :--------: | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :---------------------------------- |
| name                      |  string   |  Required  | Name of the load balancer rule                                                                                                                                                                                             |                                     |
| key                       |  string   |  Required  | key of the azure load balancer                                                                                                                                                                                             |                                     |
| frontend_ip_name          |  string   |  Required  | frontend ip name of the load balancer                                                                                                                                                                                      |                                     |
| backend_pool_name         |  string   |  Required  | bakcnedpool name of the load balancer                                                                                                                                                                                      |                                     |
| lb_protocol               |  string   |  Optional  | The transport protocol for the external endpoint.                                                                                                                                                                          | Tcp, Udp or All                     |
| lb_port                   |  number   |  Required  | The port for the external endpoint. Port numbers for each Rule must be unique within the Load Balancer. Set this frontend port to 0 if **_lb_protocol_** is set to "All".                                                  | 0 to 65534                          |
| backend_port              |  number   |  Required  | The port used for internal connections on the endpoint. Set this backend port to 0 if **_lb_protocol_** is set to "All".                                                                                                   | 0 to 65535                          |
| enable_floating_ip        |   bool    |  Optional  | Are the Floating IPs enabled for this Load Balncer Rule? A "floating” IP is reassigned to a secondary server in case the primary server fails. Required to configure a SQL AlwaysOn Availability Group. Defaults to false. | true, false                         |
| disable_outbound_snat     |   bool    |  Optional  | Is snat enabled for this Load Balancer Rule? Default false.                                                                                                                                                                | true,false                          |
| enable_tcp_reset          |   bool    |  Optional  | Is TCP Reset enabled for this Load Balancer Rule? Defaults to false.                                                                                                                                                       | true, false                         |
| probe_port                |  number   |  Required  | Port on which the Probe queries the backend endpoint.                                                                                                                                                                      | 0 to 65535                          |
| probe_protocol            |  string   |  Required  | Specifies the protocol of the end point backend endpoint.                                                                                                                                                                  | Http, Https or Tcp.                 |
| request_path              |  string   |  Optional  | The URI used for requesting health status from the backend endpoint. Required if **_probe_protocol_** is set to "Http"                                                                                                     |                                     |
| probe_interval            |  number   |  Optional  | The interval, in seconds between probes to the backend endpoint for health status.                                                                                                                                         |                                     |
| probe_unhealthy_threshold |  number   |  Optional  | The number of failed probe attempts after which the backend endpoint is removed from rotation.                                                                                                                             |                                     |
| load_distribution         |  string   |  Optional  | Specifies the load balancing distribution type to be used by the Load Balancer.                                                                                                                                            | Default,SourceIP,SourceIPProtocol,  |
| idle_timeout_in_minutes   |  number   |  Optional  | Specifies the idle timeout in minutes for TCP connections                                                                                                                                                                  | values are between 4 and 30 minutes |

#### load_balancer_nat_rules `map(object({}))`

    Map of Load balancer NAT rules which needs to be created in a Load balancer

| Attribute               |  Data Type   | Field Type | Description                                                | Allowed Values                      |
| :---------------------- | :----------: | :--------: | :--------------------------------------------------------- | :---------------------------------- |
| name                    |    string    |  Required  | name of the load balancer NAT rule                         |                                     |
| lb_keys                 | list(string) |  Required  | List of load balancer key names.                           |                                     |
| frontend_ip_name        |    string    |  Required  | frontend ip name of load balancer                          |                                     |
| lb_port                 |    number    |  Required  | port used for External connections on the endpoint.        | values range between 1 and 65534    |
| backend_port            |    number    |  Required  | port used for internal connections on the endpoint.        | values range between 1 and 65535    |
| idle_timeout_in_minutes |    number    |  Required  | Specifies the idle timeout in minutes for TCP connections. | values are between 4 and 30 minutes |

#### load_balancer_nat_pools `map(object({}))`

    Map containing load balancer nat pool parameters for VMSS

| Attribute        | Data Type | Field Type | Description                                                                                                                               | Allowed Values                   |
| :--------------- | :-------: | :--------: | :---------------------------------------------------------------------------------------------------------------------------------------- | :------------------------------- |
| name             |  string   |  Required  | Specifies the name of the NAT pool                                                                                                        |                                  |
| lb_key           |  string   |  Required  | key name of Load alancer                                                                                                                  |                                  |
| frontend_ip_name |  string   |  Required  | front end ip name of load balancer                                                                                                        |                                  |
| lb_port_start    |  number   |  Required  | The first port number in the range of external ports that will be used to provide Inbound Nat to NICs associated with this Load Balancer. | values range between 1 and 65534 |
| lb_port_end      |  number   |  Required  | The last port number in the range of external ports that will be used to provide Inbound Nat to NICs associated with this Load Balancer.  | values range between 1 and 65535 |
| backend_port     |  number   |  Required  | The port used for the internal endpoint.                                                                                                  | values range between 1 and 65535 |

#### lb_outbound_rules `map(object({}))`

    Map of load balancer rules which needs to be created in a load balancer

| Attribute                       |  Data Type   | Field Type | Description                                      | Allowed Values |
| :------------------------------ | :----------: | :--------: | :----------------------------------------------- | :------------- |
| name                            |    string    |  Required  | Name of the outbound rule                        |                |
| lb_key                          |    string    |  Required  | key name of the load balancer                    |                |
| protocol                        |    string    |  Required  | protocol for the external endpoint.              | Udp, Tcp, All  |
| allocated_outbound_ports        |    number    |  Required  | The number of outbound ports to be used for NAT. |                |
| frontend_ip_configuration_names | list(string) |  Required  | List of frontend ip config names                 |                |

#### lb_additional_tags `map(string)`

     A map of tags to load balancer resource.

## Outputs

## Reference

[azurerm_lb](https://www.terraform.io/docs/providers/azurerm/r/lb.html) <br />


## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.59.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.88.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_lb.lb](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb) | resource |
| [azurerm_lb_backend_address_pool.lb_be_pool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_backend_address_pool) | resource |
| [azurerm_lb_nat_pool.lb_nat_pool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_nat_pool) | resource |
| [azurerm_lb_nat_rule.lb_nat_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_nat_rule) | resource |
| [azurerm_lb_outbound_rule.lb_outbound_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_outbound_rule) | resource |
| [azurerm_lb_probe.lb_probe](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_probe) | resource |
| [azurerm_lb_rule.lb_rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_rule) | resource |
| [azurerm_network_interface_backend_address_pool_association.bepool_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_backend_address_pool_association) | resource |
| [azurerm_network_interface.nic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/network_interface) | data source |
| [azurerm_resource_group.nic_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_resource_group.vnet_rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_emptylist"></a> [emptylist](#input\_emptylist) | n/a | `list(string)` | <pre>[<br>  "null",<br>  "null"<br>]</pre> | no |
| <a name="input_frontend_ip_configuration_name"></a> [frontend\_ip\_configuration\_name](#input\_frontend\_ip\_configuration\_name) | Containing load balancer frontend IP name | `string` | n/a | yes |
| <a name="input_lb_outbound_rules"></a> [lb\_outbound\_rules](#input\_lb\_outbound\_rules) | Map containing outbound nat rule parameters | <pre>map(object({<br>    name                            = string<br>    lb_key                          = string<br>    protocol                        = string<br>    backend_pool_name               = string<br>    allocated_outbound_ports        = number<br>    frontend_ip_configuration_names = list(string)<br><br>  }))</pre> | `{}` | no |
| <a name="input_load_balancer_backendpool_name"></a> [load\_balancer\_backendpool\_name](#input\_load\_balancer\_backendpool\_name) | Containing load balancer backendpool | `string` | n/a | yes |
| <a name="input_load_balancer_name"></a> [load\_balancer\_name](#input\_load\_balancer\_name) | Containing load balancer name | `string` | n/a | yes |
| <a name="input_load_balancer_nat_pools"></a> [load\_balancer\_nat\_pools](#input\_load\_balancer\_nat\_pools) | Map containing load balancer nat pool parameters | <pre>map(object({<br>    name             = string<br>    lb_key           = string<br>    frontend_ip_name = string<br>    lb_port_start    = number<br>    lb_port_end      = number<br>    backend_port     = number<br>  }))</pre> | `{}` | no |
| <a name="input_load_balancer_nat_rules"></a> [load\_balancer\_nat\_rules](#input\_load\_balancer\_nat\_rules) | Map containing load balancer nat rule parameters | <pre>map(object({<br>    name                    = string<br>    lb_keys                 = list(string)<br>    frontend_ip_name        = string<br>    lb_port                 = number<br>    backend_port            = number<br>    idle_timeout_in_minutes = number<br>  }))</pre> | `{}` | no |
| <a name="input_load_balancer_rules"></a> [load\_balancer\_rules](#input\_load\_balancer\_rules) | Map containing load balancer rule and probe parameters | <pre>map(object({<br>    name                      = string<br>    probe_name                = string<br>    lb_key                    = string<br>    #frontend_ip_name          = string<br>    #backend_pool_name         = string<br>    lb_protocol               = string<br>    lb_port                   = string<br>    backend_port              = number<br>    enable_floating_ip        = bool<br>    disable_outbound_snat     = bool<br>    enable_tcp_reset          = bool<br>    probe_port                = number<br>    probe_protocol            = string<br>    request_path              = string<br>    probe_interval            = number<br>    probe_unhealthy_threshold = number<br>    load_distribution         = string<br>    idle_timeout_in_minutes   = number<br>  }))</pre> | `{}` | no |
| <a name="input_load_balancer_sku"></a> [load\_balancer\_sku](#input\_load\_balancer\_sku) | load balancer sku | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location details in which to create the Load Balancer | `string` | n/a | yes |
| <a name="input_network_interfaces"></a> [network\_interfaces](#input\_network\_interfaces) | Map containing network interface parameters | <pre>map(object({<br>    name                    = string<br>    network_interface_id    = string<br>    ip_configuration_name   = string<br>  }))</pre> | `{}` | no |
| <a name="input_nic_resource_group_name"></a> [nic\_resource\_group\_name](#input\_nic\_resource\_group\_name) | The name of the Network Interface Resource Group | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Resource Group in which to create the Load Balancer | `string` | n/a | yes |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | The name of the subnet to use in azure load balancer | `string` | n/a | yes |
| <a name="input_tag_BusinessUnit"></a> [tag\_BusinessUnit](#input\_tag\_BusinessUnit) | Loadbalancer tag BusinessUnit | `string` | n/a | yes |
| <a name="input_tag_Confidentiality"></a> [tag\_Confidentiality](#input\_tag\_Confidentiality) | Loadbalancer tag confidentiality | `string` | n/a | yes |
| <a name="input_tag_Environment"></a> [tag\_Environment](#input\_tag\_Environment) | Loadbalancer tag Environment | `string` | n/a | yes |
| <a name="input_tag_OpCo"></a> [tag\_OpCo](#input\_tag\_OpCo) | Loadbalancer tag OpCo | `string` | n/a | yes |
| <a name="input_tag_Owner"></a> [tag\_Owner](#input\_tag\_Owner) | Loadbalancer tag Owner | `string` | n/a | yes |
| <a name="input_tag_Project"></a> [tag\_Project](#input\_tag\_Project) | Loadbalancer tag Project | `string` | n/a | yes |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | The name of the virtual network | `string` | n/a | yes |
| <a name="input_vnet_resource_group_name"></a> [vnet\_resource\_group\_name](#input\_vnet\_resource\_group\_name) | The name of the Virtual Network Resource Group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_pri_lb_backend_ids"></a> [pri\_lb\_backend\_ids](#output\_pri\_lb\_backend\_ids) | n/a |
| <a name="output_pri_lb_frontend_ip_configurations"></a> [pri\_lb\_frontend\_ip\_configurations](#output\_pri\_lb\_frontend\_ip\_configurations) | n/a |
| <a name="output_pri_lb_names"></a> [pri\_lb\_names](#output\_pri\_lb\_names) | n/a |
| <a name="output_pri_lb_natpool_map_ids"></a> [pri\_lb\_natpool\_map\_ids](#output\_pri\_lb\_natpool\_map\_ids) | n/a |
| <a name="output_pri_lb_natrule_map_ids"></a> [pri\_lb\_natrule\_map\_ids](#output\_pri\_lb\_natrule\_map\_ids) | n/a |
| <a name="output_pri_lb_probe_ids"></a> [pri\_lb\_probe\_ids](#output\_pri\_lb\_probe\_ids) | n/a |
| <a name="output_pri_lb_probe_map_ids"></a> [pri\_lb\_probe\_map\_ids](#output\_pri\_lb\_probe\_map\_ids) | n/a |
| <a name="output_pri_lb_rule_ids"></a> [pri\_lb\_rule\_ids](#output\_pri\_lb\_rule\_ids) | n/a |
