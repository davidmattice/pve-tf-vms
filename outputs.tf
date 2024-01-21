
locals {
    vms = { for vm in module.virtual_machines : vm.vm.vm_id => {
            "desc" = vm.vm.description,
            "name" = format("%s.%s", vm.vm.name, vm.vm.initialization[0].dns[0].domain),
            "addr" = vm.vm.ipv4_addresses[1][0]
        }
    }
}
output "virtual_machines" {
    description = "Details for Virtual Machines created"
    value = local.vms
}

#output "data_stores" {
#    value = data.proxmox_virtual_environment_datastores.first_node
#}

#output "template" {
#    value = data.proxmox_virtual_environment_vms.template
#}
#output "vms" {
#    value = format("Tempalte being use is: %s", local.template_name)
#}

#output "virtual_machines_all" {
#    value = [ 
#        for vm in module.virtual_machines : vm.vm
#    ]
#}

#output "user_data" {
#    description = "File used for user_data"
#    value       = local.user_data_file
#}

#output "Vendor_config" {
#    description = "File used for vendor config"
#    value = local.vendor_config_file
#}