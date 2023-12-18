#output "data_stores" {
#    value = data.proxmox_virtual_environment_datastores.first_node
#}

output "template" {
    value = data.proxmox_virtual_environment_vms.template
}
#output "vms" {
#    value = format("Tempalte being use is: %s", local.template_name)
#}

output "virtual_machines" {
    value = [ 
        for vm in module.virtual_machines : vm.vm
    ]
}

#output "user_data" {
#    description = "File used for user_data"
#    value       = local.user_data_file
#}

#output "Vendor_config" {
#    description = "File used for vendor config"
#    value = local.vendor_config_file
#}