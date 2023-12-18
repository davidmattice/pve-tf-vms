##############################
# Proxmox Virtual Environment 
##############################
# See the README for for settings

##############################
# Template specifics
##############################
template_tags   = ["ubuntu", "jammy", "template"]  # Search for a template with these tags first, use if found, create if not

##############################
# Virtual Machines
##############################
machines = {
    "docker5" = {
        description = "Docker Host"
        vm_tags = ["docker", "docker5"]
        node_name = "pve1"
        custom_user_data_file = "docker5-user-data"
        custom_vendor_config_file = "docker5-vendor-config"
    }
}