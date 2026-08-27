terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.66"
    }
  }
}

provider "proxmox" {
  endpoint  = var.pm_api_url
  api_token = var.pm_api_token
  insecure  = true
}
variable "pm_api_url" {
  description = "Proxmox API URL, e.g. https://192.168.10.225:8006/"
  type        = string
}

variable "pm_api_token" {
  description = "Proxmox API token: user@realm!tokenid=secret"
  type        = string
  sensitive   = true
}

variable "target_node" {
  description = "Proxmox node name"
  type        = string
  default     = "zeus"
}

variable "template_vm_id" {
  description = "VM ID of the cloud-init template to clone"
  type        = number
}

variable "ssh_public_key_path" {
  description = "Path to your SSH public key, injected into the VM"
  type        = string
  default     = "~/.ssh/Proxmox-Cloudinit.pub"
}
