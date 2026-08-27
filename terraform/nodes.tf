locals {
  ssh_keys = [trimspace(file(var.ssh_public_key_path))]
}

module "node01" {
  source          = "./modules/ha-node"
  name            = "guac-ha-node01"
  vm_id           = 301
  target_node     = var.target_node
  template_vm_id  = var.template_vm_id
  cores           = 2
  memory_mb       = 4096
  disk_size_gb    = 32
  ipv4_address    = "10.101.10.101/24"
  ipv4_gateway    = "10.101.10.1"
  ssh_public_keys = local.ssh_keys
  tags            = ["ha-guacamole", "master"]
}

module "node02" {
  source          = "./modules/ha-node"
  name            = "guac-ha-node02"
  vm_id           = 302
  target_node     = var.target_node
  template_vm_id  = var.template_vm_id
  cores           = 2
  memory_mb       = 4096
  disk_size_gb    = 32
  ipv4_address    = "10.101.10.102/24"
  ipv4_gateway    = "10.101.10.1"
  ssh_public_keys = local.ssh_keys
  tags            = ["ha-guacamole", "backup"]
}

module "node03" {
  source          = "./modules/ha-node"
  name            = "guac-ha-node03"
  vm_id           = 303
  target_node     = var.target_node
  template_vm_id  = var.template_vm_id
  cores           = 1
  memory_mb       = 2048
  disk_size_gb    = 20
  ipv4_address    = "10.101.10.103/24"
  ipv4_gateway    = "10.101.10.1"
  ssh_public_keys = local.ssh_keys
  tags            = ["ha-guacamole", "quorum"]
}

output "nodes" {
  value = {
    node01 = module.node01.ipv4_address
    node02 = module.node02.ipv4_address
    node03 = module.node03.ipv4_address
  }
}
