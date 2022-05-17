data "ibm_is_vpc" "rt_lab" {
  name = var.lab_vpc
}

data "ibm_resource_group" "cde_lab" {
  name = var.resource_group
}

data "ibm_is_ssh_key" "europa" {
  name = "europa-ca-tor"
}

data "ibm_is_ssh_key" "dreadnought" {
  name = "dreadnought-ca-tor"
}


data "ibm_is_zones" "regional_zones" {
  region = var.region
}

data "ibm_is_security_group" "internal_sg" {
  name = "rt-lab-v1-lab-sg"
}

data "ibm_resource_instance" "cos_instance" {
  name              = "rt-lab-v1-cos"
  location          = "global"
  resource_group_id = data.ibm_resource_group.cde_lab.id
  service           = "cloud-object-storage"
}

data "ibm_resource_instance" "at_instance" {
  name              = "activity-tracker-ca-tor-2022-cde-lab"
  location          = var.region
  resource_group_id = data.ibm_resource_group.cde_lab.id
  service           = "logdnaat"
}