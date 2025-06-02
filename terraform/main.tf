terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# Créer un bucket GCS pour les fichiers raw / landing zone
resource "google_storage_bucket" "raw_data_bucket" {
  name     = "${var.project_id}-raw-data"
  location = var.region
  force_destroy = true
  uniform_bucket_level_access = true
}

# Créer un dataset BigQuery pour les données transformées
resource "google_bigquery_dataset" "taxi_dataset" {
  dataset_id                  = "chicago_taxi"
  friendly_name               = "Chicago Taxi Dataset"
  description                 = "Dataset contenant les données transformées par dbt"
  location                    = var.region
  delete_contents_on_destroy  = true
  default_table_expiration_ms = 2592000000
}

# Créer un service account pour dbt ou ingestion
resource "google_service_account" "dbt_sa" {
  account_id   = "dbt-transformer"
  display_name = "Service Account for dbt transformations"
}

# Donner les permissions nécessaires au service account sur GCS et BigQuery
resource "google_project_iam_member" "bq_data_editor" {
  project = var.project_id
  role    = "roles/bigquery.dataEditor"
  member  = "serviceAccount:${google_service_account.dbt_sa.email}"
}

resource "google_project_iam_member" "storage_admin" {
  project = var.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.dbt_sa.email}"
}
