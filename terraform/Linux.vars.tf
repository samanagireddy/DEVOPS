variable "myvm_vm_name" {
  description = "VMware vSphere Virtual Machine Name"
}

variable "myvm_instances" {
  description = "Number of VM instances"
  default = 1
}

variable "myvm_vm_cpus" {
  description = "Number of vCPUs"
  default     = "2"
}

variable "myvm_vm_cores" {
  description = "Number of cores"
}

variable "myvm_vm_memory" {
  description = "Amount of memory assigned to the virtual machine"
}

variable "myvm_vm_domain_name" {
  description = "Virtual machine domain name"
}

variable "myvm_network" {
  description = "Define PortGroup and IPs for each VM"
  type        = map(list(string))
  default     = {}
}

# variable "myvm_network2" {
#   description = "Define PortGroup and IPs for each VM"
#   type        = map(list(string))
#   default     = {}
# }

# variable "myvm_network3" {
#   description = "Define PortGroup and IPs for each VM"
#   type        = map(list(string))
#   default     = {}
# }

variable "myvm_vm_disk_size" {
  description = "Disk size"
}

variable "myvm_vm_io_limit" {
  description = "Disk IOPS limitation"
}

variable "myvm_vm_swap_size" {
  description = "Disk swap size for linux VM"
  default = "4g"
}
