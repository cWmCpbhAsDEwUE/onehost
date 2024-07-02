# onehost
## A simple module to deploy a VM on VSphere using terraform
### use the following syntax to call, edit as necessary:
module "vm-guest" {
  source          = "https://github.com/cWmCpbhAsDEwUE/onehost.git"
  vm-user         = ""
  vm-password     = ""
  vsphere-host    = ""
  vmcluster-name  = ""
  data-center     = ""
  data-store      = ""
  vm-network      = ""
  vm-template     = ""
  vm-guest-name   = ""
  num-cpus        = 1
  vm-memory       = 8192
  local-admin-pwd = ""
  ipv4-addr       = ""
  ipv4-mask       = 24
  ipv4-gw         = ""
  dns-list        = ["8.8.8.8", "4.4.4.4"]
}
 
