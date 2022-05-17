variable "region" {
  description = "Region for VPC deployments."
  type        = string
  default     = "ca-tor"
}

variable "lab_vpc" {
  description = "Name of the existing VPC where resources will be deployed."
  type        = string
  default     = "rt-lab-v1-vpc"
}

variable "resource_group" {
  description = ""
  type        = string
  default     = "2022-cde-lab"
}

variable "tags" {
  default = ["owner:ryantiffany", "project:rt-lab-v1"]
}

