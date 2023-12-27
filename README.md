# Proxmox Virtual Environment - Templates

Terraform for creating VM Templates in PVE

## Environment variables

Set the following environment variables for the provider.

```
export PROXMOX_VE_ENDPOINT="https://<ip|hostname>:8006"
export PROXMOX_VE_USERNAME="<user>@<pam|pve>"
export PROXMOX_VE_PASSWORD=<password>" # This is required for SSH access to the node for some resources
```

## State Management

Added a local backend to the **providers.tf** file to store state

```
  backend "local" {
    workspace_dir = "/mnt/terraform/state"
  }
```

## References

[PVE Terraform Provider](https://registry.terraform.io/providers/bpg/proxmox/latest)
