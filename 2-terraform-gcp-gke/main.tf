resource "google_container_cluster" "primary" {
  project  = "sandbox-13-252"
  name     = "sandbox-cluster-v1"
  location = "us-central1"

  deletion_protection = false

  remove_default_node_pool = false
  initial_node_count       = 1
  gateway_api_config {
    channel = "CHANNEL_STANDARD"
  }
  node_config {
    machine_type = "e2-standard-2"
    disk_size_gb = 50
  }
}