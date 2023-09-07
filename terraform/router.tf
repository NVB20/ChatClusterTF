#enable internet acces to nodes
resource "google_compute_router" "router" {
  name    = "router"
  region  = "us-central1"

  network = google_compute_network.main-vpc.id

}