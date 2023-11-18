data "google_client_config" "provider" {
}

data "google_container_cluster" "my_cluster" {
  project  = "sandbox-13-252"
  name     = "sandbox-cluster-v1"
  location = "us-central1"
}

provider "kubernetes" {
  host  = "https://${data.google_container_cluster.my_cluster.endpoint}"
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate,
  )
}
provider "kubectl" {
  host = "https://${data.google_container_cluster.my_cluster.endpoint}"
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.my_cluster.master_auth[0].cluster_ca_certificate,
  )
  token = data.google_client_config.provider.access_token
  load_config_file       = false
}