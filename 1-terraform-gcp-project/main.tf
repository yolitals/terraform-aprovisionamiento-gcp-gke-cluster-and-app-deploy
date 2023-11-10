resource "random_integer" "project-id" {
  min = 200
  max = 300
}

resource "google_project" "my_project" {
  name            = "sandbox-13"
  project_id      = "sandbox-13-${random_integer.project-id.result}"
  org_id          = "24851311546"
  billing_account = "014413-D964D8-7A33D2"
}

resource "google_project_service" "enable-api" {
  project                    = google_project.my_project.id
  service                    = "container.googleapis.com"
  disable_dependent_services = true
}

resource "google_service_account" "service_account" {
  project      = split("/",google_project.my_project.id)[1]
  account_id   = "automation"
  display_name = "automation"
}