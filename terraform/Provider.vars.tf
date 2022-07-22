variable "vsphere_user" {
  description = "vSphere user"
}

variable "vsphere_password" {
  description = "vsphere password"
  default     = "__vspherepassword__" #it's not safe to input the password here I have to update and crypt passwords
}

variable "vsphere_server" {
  description = "vsphere server"
}

variable "vsphere_datacenter" {
  description = "VMware vSphere Datacenter Name"
}

variable "vsphere_cluster" {
  description = "VMware vSphere Computer Cluster Name"
}

variable "vsphere_pool" {
  description = "Vsphere Pool"
}

#variable "vsphere_network" {
#  description = "VMware vSphere Network Name"
#}


#variable "vsphere_network2" {
#  description = "VMWare secend Network Name"
#}

#variable "vsphere_network3" {
#  description = "VMWare secend Network Name"
#}

variable "vsphere_datastore" {
  description = "VMware vSphere Datastore"
}

variable "vsphere_template" {
  description = "VMware Template"
}

variable "vm_default_gateway" {
  description = "Virtual machine default gateway"
}

#variable "vm_network_cidr" {
#  description = "Virtual machine network cidr"
#  default     = 29
#}

variable "vm_network_type" {
  description = "Define network type for each network interface."
  type        = list(any)
  default     = null
}

variable "vm_network_cidr" {
  description = "ipv4 Subnet mask."
  type        = list(any)
  default     = ["24"]
}

variable "vm_dns_server" {
  description = "Virtual machine dns server"
  default     = "1.1.1.1"
}

variable "vm_dns_server2" {
  description = "Virtual machine secondary dns server"
  default     = "8.8.8.8"
}

variable "vm_folder_name" {
  description = "VM installatino folder"
}

#variable "vm_host_name" {
#  description = "Windows host name"
#}

variable "vm_host_password" {
  description = "Administrtor password for windows"
}

variable "vm_host_password2" {
  description = "New password for linux servers after install"
}
