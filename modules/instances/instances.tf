resource "google_compute_instance" "tf-instance-1" {
  name         = "tf-instance-1"
  machine_type = "e2-standard-2"
  boot_disk {
    initialize_params {
      image  = "debian-cloud/debian-10"
      labels = {}
    }
  }
  network_interface {
    network    = "tf-vpc-367336"
    subnetwork = "projects/qwiklabs-gcp-03-e81c6d0eb19b/regions/us-central1/subnetworks/subnet-01"
  }

  allow_stopping_for_update = true
  metadata_startup_script = <<-EOT
    #!/bin/bash
  EOT
}

resource "google_compute_instance" "tf-instance-2" {
  name         = "tf-instance-2"
  machine_type = "e2-standard-2"
  boot_disk {
    initialize_params {
      image  = "debian-cloud/debian-10"
    }
  }
  network_interface {
    network    = "tf-vpc-367336"
    subnetwork = "projects/qwiklabs-gcp-03-e81c6d0eb19b/regions/us-central1/subnetworks/subnet-02"
  }

  allow_stopping_for_update = true
  metadata_startup_script = <<-EOT
    #!/bin/bash
  EOT
}

