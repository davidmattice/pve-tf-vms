provider "proxmox" {
  # endpoint = Use PROXMOX_VE_ENDPOINT environment variable
  # username = Use PROXMOX_VE_USERNAME environment variable
  # password = Use PROXMOX_VE_PASSWORD environment variable
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
  backend "local" {
    workspace_dir = "/mnt/terraform/state"
  }
}
