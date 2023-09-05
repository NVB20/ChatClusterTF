resource "google_compute_firewall" "allow-traffic" {
  name = "allow-traffic"
  network = google_compute_network.main.name

  allow {
    protocol = "tcp"
    ports = [ "22", "8080", "80", "5000", "27017", "443", "53" ]
  }

  source_ranges = [ "0.0.0.0/0" ]
}