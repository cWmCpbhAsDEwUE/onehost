terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.8.1"
    }
  }
}

# Configure the vSphere Provider
provider "vsphere" {
  user                 = var.vm-user
  password             = var.vm-password
  vsphere_server       = var.vsphere-host
  allow_unverified_ssl = true
}
