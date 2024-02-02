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
    "sample" = {
        description = "Docker Host"
        vm_tags = ["docker", "sample"]
        node_name = "pve"
        custom_user_data_file = "sample-user-data"
        custom_vendor_config_file = "sample-vendor-config"
        cpu_cores = 2
        memory_mb = 4096
        network_devices = {
            "vmbr0" = {
                "bridge" = "vmbr0"
                "address" = "192.168.1.20/24"
                "gateway" = "192.168.1.1"
            }
            "vmbr1" = {
                "bridge" = "vmbr1"
            }
        }
    }
}
