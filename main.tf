module "zone1" {
  source           = "./zone"
  region           = var.region
  name             = "lab-${data.ibm_is_zones.regional_zones.zones[0]}-instance"
  tags             = concat(var.tags, ["region:${var.region}", "zone:${data.ibm_is_zones.regional_zones.zones[0]}"])
  zone             = data.ibm_is_zones.regional_zones.zones[0]
  subnet           = data.ibm_is_vpc.rt_lab.subnets[index(data.ibm_is_vpc.rt_lab.subnets.*.zone, data.ibm_is_zones.regional_zones.zones[0])].id
  ssh_keys         = [data.ibm_is_ssh_key.dreadnought.id, data.ibm_is_ssh_key.europa.id]
  lab_vpc          = data.ibm_is_vpc.rt_lab.id
  resource_group   = data.ibm_resource_group.cde_lab.id
  cos_instance     = data.ibm_resource_instance.cos_instance.id
  security_groups  = [data.ibm_is_vpc.rt_lab.default_security_group, data.ibm_is_security_group.internal_sg.id]
  activity_tracker = data.ibm_resource_instance.at_instance.id
}

module "zone2" {
  source           = "./zone"
  region           = var.region
  name             = "lab-${data.ibm_is_zones.regional_zones.zones[1]}-instance"
  tags             = concat(var.tags, ["region:${var.region}", "zone:${data.ibm_is_zones.regional_zones.zones[1]}"])
  zone             = data.ibm_is_zones.regional_zones.zones[1]
  subnet           = data.ibm_is_vpc.rt_lab.subnets[index(data.ibm_is_vpc.rt_lab.subnets.*.zone, data.ibm_is_zones.regional_zones.zones[1])].id
  ssh_keys         = [data.ibm_is_ssh_key.dreadnought.id, data.ibm_is_ssh_key.europa.id]
  lab_vpc          = data.ibm_is_vpc.rt_lab.id
  resource_group   = data.ibm_resource_group.cde_lab.id
  cos_instance     = data.ibm_resource_instance.cos_instance.id
  security_groups  = [data.ibm_is_vpc.rt_lab.default_security_group, data.ibm_is_security_group.internal_sg.id]
  activity_tracker = data.ibm_resource_instance.at_instance.id
}
