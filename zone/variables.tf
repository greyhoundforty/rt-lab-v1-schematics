variable "name" {}

variable "tags" {}

variable "subnet" {}

variable "zone" {}

variable "ubuntu_image" {
  default = "ibm-ubuntu-20-04-3-minimal-amd64-2"
}

variable "lab_vpc" {}

variable "profile" {
  default = "cx2-4x8"
}

variable "ssh_keys" {}

variable "resource_group" {}

variable "security_groups" {}

variable "cos_instance" {}

variable "activity_tracker" {}

variable "region" {}