provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
  zone    = "${var.zone}"
}

resource "google_compute_instance" "gitlab-ci-instance" {
  name         = "gitlab-ci-review"
  machine_type = "${var.machine_type}"
  zone         = "${var.zone}"

  boot_disk {
    initialize_params {
      size  = "${var.disk_size}"
      image = "${var.disk_image}"
    }
  }

  tags = ["docker-machine", "http-server", "https-server"]

  network_interface {
    network = "default"

    access_config {}
  }
}
