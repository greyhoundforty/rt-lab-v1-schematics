resource "ibm_is_instance" "instance" {
  name                     = var.name
  image                    = data.ibm_is_image.ubuntu20.id
  profile                  = var.profile
  metadata_service_enabled = true
  resource_group           = var.resource_group
  user_data                = file("${path.module}/init.yml")

  primary_network_interface {
    name              = "eth0"
    subnet            = var.subnet
    allow_ip_spoofing = true
    security_groups   = [var.security_groups[0]]
  }

  network_interfaces {
    name              = "eth1"
    subnet            = var.subnet
    allow_ip_spoofing = false
    security_groups   = [var.security_groups[1]]
  }

  vpc  = var.lab_vpc
  zone = var.zone
  keys = var.ssh_keys
  tags = var.tags

  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }
}

resource "ibm_cos_bucket" "subnet_flowlog_bucket" {
  depends_on           = [ibm_is_instance.instance]
  bucket_name          = "${var.name}-${var.zone}-flowlog-collector-bucket"
  resource_instance_id = var.cos_instance
  region_location      = var.region
  storage_class        = "standard"
  activity_tracking {
    read_data_events     = true
    write_data_events    = true
    activity_tracker_crn = var.activity_tracker
  }
}

resource "ibm_is_flow_log" "subnet_flowlog_collector" {
  depends_on     = [ibm_cos_bucket.subnet_flowlog_bucket]
  name           = "${var.name}-${var.zone}-flowlog-collector"
  target         = var.subnet
  active         = true
  resource_group = var.resource_group
  storage_bucket = ibm_cos_bucket.subnet_flowlog_bucket.bucket_name
  tags           = var.tags
}

