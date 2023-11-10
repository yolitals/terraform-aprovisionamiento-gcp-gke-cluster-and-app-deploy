resource "random_integer" "project-id" {
  min = 200
  max = 300
}

resource "google_project" "my_project" {
  name            = "sandbox-local"
  project_id      = "sandbox-local-${random_integer.project-id.result}"
  org_id          = "24851311546"
  billing_account = "014413-D964D8-7A33D2"
}

resource "google_project_service" "enable-api" {
  for_each = toset(["compute.googleapis.com","container.googleapis.com","certificatemanager.googleapis.com"])
  project                    = google_project.my_project.id
  service                    = each.value
  disable_dependent_services = true
}
