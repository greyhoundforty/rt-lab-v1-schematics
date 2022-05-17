terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "1.41.1"
    }
  }
}

provider "ibm" {
  region = var.region
}