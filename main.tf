data "vsphere_datacenter" "datacenter" {
  name = var.data-center
}

# Data source to fetch the ESXi cluster
data "vsphere_compute_cluster" "cluster" {
  name          = var.vmcluster-name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

# Data source to fetch the datastore
data "vsphere_datastore" "datastore" {
  name          = var.data-store
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

# Data source to fetch the network
data "vsphere_network" "network" {
  name          = var.vm-network
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.vm-template
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

# Resource to create the Windows VM
resource "vsphere_virtual_machine" "windows_vm" {
  name                       = var.vm-guest-name
  resource_pool_id           = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id               = data.vsphere_datastore.datastore.id
  wait_for_guest_net_timeout = 30
  wait_for_guest_ip_timeout  = 30
  num_cpus                   = var.num-cpus
  memory                     = var.vm-memory

  #guest_id = "windows9Server64Guest"
  #firmware = "efi"
  guest_id  = data.vsphere_virtual_machine.template.guest_id
  scsi_type = data.vsphere_virtual_machine.template.scsi_type
  firmware  = data.vsphere_virtual_machine.template.firmware

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  /*
  disk {
    label            = "data"
    size             = 100 # 100GB
    thin_provisioned = true
    unit_number      = 1
  }
  */

  clone {
    template_uuid = data.vsphere_virtual_machine.template.uuid
    customize {
      timeout = 30

      windows_options {
        computer_name  = var.vm-guest-name
        workgroup      = "BAR"
        admin_password = var.local-admin-pwd
      }
      network_interface {
        ipv4_address    = var.ipv4-addr
        ipv4_netmask    = var.ipv4-mask
        dns_server_list = var.dns-list
      }
      ipv4_gateway = var.ipv4-gw
    }
  }
}

