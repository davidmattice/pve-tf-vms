
locals {
#  user_data_file = var.custom_user_data_file == "" ? "" : (fileexists(format("./custom/%s.yaml", var.custom_user_data_file)) ? format("./custom/%s.yaml", var.custom_user_data_file) : "")
#  vendor_config_file = var.custom_vendor_config_file == "" ? "" : (fileexists(format("./custom/%s.yaml", var.custom_vendor_config_file)) ? format("./custom/%s.yaml", var.custom_vendor_config_file) : "")
  template_id = length(data.proxmox_virtual_environment_vms.template.vms) > 0 ? data.proxmox_virtual_environment_vms.template.vms[0].vm_id : 0
}

# Find the template based on the tags provided
# data.proxmox_virtual_environment_vms.template.vms[0].vm_id
data "proxmox_virtual_environment_vms" "template" {
  tags      = var.template_tags
}

module "virtual_machines" {
  for_each       = var.machines
    source       = "git::https://github.com/davidmattice/pve-tfm-vm?ref=v0.1.x"
    providers     = {
      proxmox = proxmox
    }

    pve_node_name = each.value.node_name
    template_id = local.template_id

    name = format("%s", each.key)
    domain_name = "general.local"
    description = each.value.description
    additional_tags = each.value.vm_tags

    cpu = {
      cores = each.value.cpu_cores
    }
    memory = {
      dedicated = each.value.memory_mb
    }
    
    custom_user_data_file = each.value.custom_user_data_file == "" ? "" : (fileexists(format("./custom/%s.yaml", each.value.custom_user_data_file)) ? format("./custom/%s.yaml", each.value.custom_user_data_file) : "")
    custom_vendor_config_file = each.value.custom_vendor_config_file == "" ? "" : (fileexists(format("./custom/%s.yaml", each.value.custom_vendor_config_file)) ? format("./custom/%s.yaml", each.value.custom_vendor_config_file) : "")
}