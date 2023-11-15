# module "project" {
#   source          = "../1-terraform-gcp-project"
#   org_id          = "24851311546"
#   billing_account = "017347-33616E-AF62C5"
#   sandbox_id      = var.sandbox_id
# }
module "cluster" {
  source                = "../2-terraform-gcp-gke"
  project               = "sandbox-local-264"#split("/", module.project.project_id)[1]
  sandbox_id            = var.sandbox_id
  location              = var.location
  gh_api_config_channel = var.gh_api_config_channel
  gke_node_config       = var.gke_node_config
}
resource "kubectl_manifest" "test" {
  for_each = {
    db-deployment     = "k8s-specifications/db-deployment.yaml"
    db-service        = "k8s-specifications/db-service.yaml"
    redis-deployment  = "k8s-specifications/redis-deployment.yaml"
    redis-service     = "k8s-specifications/redis-service.yaml"
    result-deployment = "k8s-specifications/result-deployment.yaml"
    result-service    = "k8s-specifications/result-service.yaml"
    vote-deployment   = "k8s-specifications/vote-deployment.yaml"
    vote-service      = "k8s-specifications/vote-service.yaml"
    worker-deployment = "k8s-specifications/worker-deployment.yaml"
  }
  yaml_body  = file("${path.module}/${each.value}")
  depends_on = [module.cluster]
}