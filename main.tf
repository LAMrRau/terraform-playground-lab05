
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

module "instances" {
  source = "./modules/instances"
}

module "network" {
  source  = "terraform-google-modules/network/google"
  version = "6.0.0"

  network_name = "tf-vpc-367336"
  project_id  = var.project_id
  subnets = [
    {
      subnet_name           = "subnet-01"
      subnet_ip             = "10.10.10.0/24"
      subnet_region         = var.region
    },
    {
      subnet_name           = "subnet-02"
      subnet_ip             = "10.10.20.0/24"
      subnet_region         = var.region
    }
  ]
}

resource "google_compute_firewall" "default" {
  name    = "tf-firewall"
  network = module.network.network_name

  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}

//
module "storage" {
  source = "./modules/storage"
  
  name = "tf-bucket-704493"
  location = "US"
}

terraform {
  backend "gcs" {
    bucket  = "tf-bucket-704493"
    prefix  = "terraform/state"
  }
}

