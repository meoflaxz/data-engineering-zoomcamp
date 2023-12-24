terraform {
    required_version = "> 1.0"
    backend "local" {}
    required_providers {
        google = {
            source = "hashicorp/google"
        }
    }
}

provider "google" {
    project = var.project
    region = var.region
}

resource "google_storage_bucket" "data-lake-bucket" {
    name        = "${local.data_lake_bucket}_${var.project}"
    location    = var.region
}

resource "google_bigquery_dataset" "dataset" {
    dataset_id  = var.BQ.dataset
    project     = var.project 
    location    = var.region
}