myvm_vm_name                     = "MyVirtalMachine"
myvm_vm_cpus                     = "1"
myvm_vm_cores                    = "1"
myvm_vm_memory                   = "1024"
myvm_vm_domain_name              = "mydomain.com"
myvm_instances                   = "1"
myvm_vm_swap_size                = "2g"
vm_network_type                  = ["vmxnet3"]
myvm_network                     = { "vmnetwork" = ["192.168.1.10"]  
                                    }
vm_network_cidr                     = ["24"] # Comment if you use DHCP
myvm_vm_disk_size                = "10"
myvm_vm_io_limit                 = "250"
# myvm_vm_disk_size2             = "DISK2_SIZE"
# myvm_vm_io_limit2              = "DISK2_IOPS_LIMIT"
# myvm_vm_ip_address2            = "YOUR_SERVER_IP2"
# vm_network_cidr2                  = "CIDR_NETMASK2"
# myvm_vm_ip_address3            = "YOUR_SERVER_IP3"
# vm_network_cidr3                  = "CIDR_NETMASK3"
vm_default_gateway                  = "192.168.1.1"
# vm_dns_server                     = "YOUR_PRIMARY_DNS"
# vm_dns_server2                    = "YOUR_SECONDARY_DNS"
vm_folder_name                      = "myvm-folder"
vm_host_password                    = "__vm_host_password__"
vm_host_password2                   = "__vm_host_password2__"

