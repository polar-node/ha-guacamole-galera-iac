variable "name" {
  description = "VM name (also used as hostname via cloud-init)"
  type        = string
}

variable "vm_id" {
  description = "Explicit Proxmox VMID for this clone"
  type        = number
}

variable "target_node" {
  description = "Proxmox node to place this VM on"
  type        = string
}

variable "template_vm_id" {
  description = "VMID of the cloud-init template to clone"
  type        = number
}

variable "cores" {
  type    = number
  default = 2
}

variable "memory_mb" {
  type    = number
  default = 4096
}

variable "disk_size_gb" {
  type    = number
  default = 32
}

variable "datastore_id" {
  type    = string
  default = "local-lvm"
}

variable "ipv4_address" {
  description = "CIDR, e.g. 10.101.101.101/24"
  type        = string
}

variable "ipv4_gateway" {
  type = string
}

variable "ssh_public_keys" {
  description = "List of public key strings (read from file with file())"
  type        = list(string)
}

variable "ci_username" {
  type    = string
  default = "ansible"
}

variable "tags" {
  type    = list(string)
  default = ["ha-guacamole"]
} 
