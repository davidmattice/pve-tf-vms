provider "proxmox" {
  # endpoint = var.pve_endpoint       # This will be picked up from PROXMOX_VE_ENDPOINT
  # username = var.pve_user           # This will be picked up from PROXMOX_VE_USERNAME
  # password = "a-strong-password"    # This will be picked up from PROXMOX_VE_PASSWORD
  insecure = true
  ssh {
    agent = true
  }
}

terraform {
  required_version = ">= 1.6"
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "~> 0.40"
    }
  }
}