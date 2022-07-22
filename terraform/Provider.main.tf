provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

/*data "vsphere_datastore" "datastore2" {
  name          = var.vsphere_datastore2
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore3" {
  name          = var.vsphere_datastore3
  datacenter_id = data.vsphere_datacenter.dc.id
}*/

data "vsphere_compute_cluster" "cluster" {
  name          = var.vsphere_cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

#data "vsphere_network" "network" {
#  name          = var.vsphere_network
#  datacenter_id = data.vsphere_datacenter.dc.id
#}
data "vsphere_network" "network" {
  count         = length(var.myvm_network)
  name          = keys(var.myvm_network)[count.index]
  datacenter_id = data.vsphere_datacenter.dc.id
}

# data "vsphere_network" "network2" {
#   count         = length(var.myvm_network2)
#   name          = keys(var.myvm_network2)[count.index]
#   datacenter_id = data.vsphere_datacenter.dc.id
# }

# data "vsphere_network" "network3" {
#   count         = length(var.myvm_network3)
#   name          = keys(var.myvm_network3)[count.index]
#   datacenter_id = data.vsphere_datacenter.dc.id
# }


#data "vsphere_network" "network2" {
#  name          = var.vsphere_network2
#  datacenter_id = data.vsphere_datacenter.dc.id
#}

#data "vsphere_network" "network3" {
#  name          = var.vsphere_network3
#  datacenter_id = data.vsphere_datacenter.dc.id
#}

data "vsphere_virtual_machine" "template" {
  name          = var.vsphere_template
  datacenter_id = data.vsphere_datacenter.dc.id
}

#data "vsphere_virtual_machine" "template2" {
#  name          = var.vsphere_template2
#  datacenter_id = data.vsphere_datacenter.dc.id
#}

#data "vsphere_virtual_machine" "template3" {
#  name          = var.vsphere_template3
#  datacenter_id = data.vsphere_datacenter.dc.id
#}
