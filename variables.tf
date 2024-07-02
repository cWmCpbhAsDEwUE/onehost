variable "vm-user" {
  type = string
}

variable "vm-password" {
  type = string
}

variable "vsphere-host" {
  type = string
}

variable "vmcluster-name" {
  type = string
}

variable "data-center" {
  type = string
}

variable "data-store" {
  type = string
}

variable "vm-network" {
  type = string
}

variable "vm-template" {
  type = string
}

variable "vm-guest-name" {
  type = string
}
variable "local-admin-pwd" {
  type = string
}

variable "ipv4-addr" {
  type = string
}

variable "ipv4-mask" {
  type = number
}

variable "ipv4-gw" {
  type = string
}

variable "dns-list" {
  type = list(string)
}

variable "num-cpus" {
  type = number
}
variable "vm-memory" {
  type = number
}