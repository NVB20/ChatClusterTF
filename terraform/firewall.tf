resource "google_compute_firewall" "allow-ssh" {
  name    = "allow-ssh"
  network = google_compute_network.main-vpc.name

  allow {
    protocol = "tcp"
    ports = [ "22", "8080", "80", "5000", "27017", "443", "53", "8443", "6443" ]

  }

  source_ranges = ["0.0.0.0/0"]
}