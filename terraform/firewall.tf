resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.main-vpc.name

  allow {
    protocol = "tcp"
    ports    = ["22", "8443", "6443", "443", "80", "5000", "8080", "27017", "8081"]
  }

  source_ranges = ["0.0.0.0/0"]
}