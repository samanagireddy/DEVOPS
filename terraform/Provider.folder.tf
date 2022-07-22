resource "vsphere_folder" "folder" {

  path          = "__vmFolder__"
  type          = "vm"
  datacenter_id = data.vsphere_datacenter.dc.id
}
