resource "vsphere_virtual_machine" "VirtualMachine" {
  count                       = var.myvm_instances
  name                        = "${var.myvm_vm_name}-Srv${count.index + 1}"
  folder                      = var.vm_folder_name
  wait_for_guest_net_routable = false
  wait_for_guest_net_timeout  = 60
  num_cpus                    = var.myvm_vm_cpus
  num_cores_per_socket        = var.myvm_vm_cores
  cpu_hot_add_enabled         = true
  cpu_hot_remove_enabled      = true
  memory                      = var.myvm_vm_memory
  memory_hot_add_enabled      = true
  resource_pool_id            = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id                = data.vsphere_datastore.datastore.id

  guest_id  = data.vsphere_virtual_machine.template.guest_id
  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  dynamic "network_interface" {
    for_each = keys(var.myvm_network) #data.vsphere_network.network[*].id #other option
    content {
      network_id   = data.vsphere_network.network[network_interface.key].id
      adapter_type = var.vm_network_type != null ? var.vm_network_type[network_interface.key] : data.vsphere_virtual_machine.template.network_interface_types[0]
    }
  }

    # dynamic "network_interface" {
  #   for_each = keys(var.myvm_network2) #data.vsphere_network.network[*].id #other option
  #   content {
  #     network_id   = data.vsphere_network.network2[network_interface.key].id
  #     adapter_type = var.vm_network_type != null ? var.vm_network_type[network_interface.key] : data.vsphere_virtual_machine.template.network_interface_types[0]
  #   }
  # }

  #   dynamic "network_interface" {
  #   for_each = keys(var.myvm_network3) #data.vsphere_network.network[*].id #other option
  #   content {
  #     network_id   = data.vsphere_network.network3[network_interface.key].id
  #     adapter_type = var.vm_network_type != null ? var.vm_network_type[network_interface.key] : data.vsphere_virtual_machine.template.network_interface_types[0]
  #   }
  # }

  disk {
    label = "disk0"
    size  = var.myvm_vm_disk_size
    #    size             = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
    io_limit         = var.myvm_vm_io_limit
  }

  #disk {
  #  label            = "disk1"
  #  size             = $disk1_size
  #  unit_number      = 1
  #  datastore_id     = data.vsphere_datastore.datastore.id
  #  thin_provisioned = true
  #  io_limit         = 250
  #}

  #disk {
  #  label            = "disk2"
  #  size             = $disk2_size
  #  unit_number      = 2
  #  datastore_id     = data.vsphere_datastore.datastore2.id
  #  thin_provisioned = true
  #  io_limit         = 100
  #}

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = var.myvm_vm_name
        domain    = var.myvm_vm_domain_name
      }

      dynamic "network_interface" {
        for_each = keys(var.myvm_network)
        content {
          ipv4_address = var.myvm_network[keys(var.myvm_network)[network_interface.key]][count.index]
          ipv4_netmask = "%{if length(var.vm_network_cidr) == 1}${var.vm_network_cidr[0]}%{else}${var.vm_network_cidr[network_interface.key]}%{endif}"
        }
      }
      dns_server_list = [var.vm_dns_server, var.vm_dns_server2]
      ipv4_gateway    = var.vm_default_gateway
    }
  }
}
