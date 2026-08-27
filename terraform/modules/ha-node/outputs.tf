output "name" {
  value = proxmox_virtual_environment_vm.node.name
}

output "vm_id" {
  value = proxmox_virtual_environment_vm.node.vm_id
}

output "ipv4_address" {
  # Guest-agent reported address (requires qemu-guest-agent running in the template)
  value = try(proxmox_virtual_environment_vm.node.ipv4_addresses[1][0], null)
}
