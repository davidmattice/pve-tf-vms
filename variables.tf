##############################
# Proxmox Virtual Environment 
##############################

variable "pve_host_name" {
    description = "PVE hostname to create this VM on.  Defaults to first host in the Cluster."
    type        = string
    default     = ""
}

##############################
# Template Details
##############################
variable "template_tags" {
    description = "The tag on the template to be used.  The first match will be used.  Template must have a tag \"template\" on it"
    type        = list(string)
    default     = []
}

##############################
# Virtual Machine Details
##############################
variable "vm_tags" {
    description = "The tags to be added to the VMs"
    type        = list(string)
    default     = []    
}

variable "default_domain" {
    description = "Default domain name to be used for all VMs"
    type        = string
}
variable "machines" {
    description = "User provided list of VMs to be managed"
    type        = map(object({
        node_name = string
        template_tags = optional(list(string), ["ubuntu", "jammy"])
        description = string
        vm_tags = optional(list(string), [])
        custom_user_data_file = optional(string,"")
        custom_vendor_config_file = optional(string,"")
        cpu_cores = optional(string,null)
        memory_mb = optional(string,null)
        network_dns_servers = optional(list(string),null)
        network_dns_domain = optional(string,null)
        network_gateway = optional(string,null)
        network_address = optional(string,null)
        network_devices = optional(map(map(string)),null)
    }))
}