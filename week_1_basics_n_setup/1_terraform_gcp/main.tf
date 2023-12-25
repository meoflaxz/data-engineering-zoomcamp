terraform {
    required_version = "> 1.0"
     # The local backend stores the Terraform state file on the local disk of the machine where Terraform commands are executed.
     # Can change from "local" to "gcs" (for google) or "s3" (for aws), if you would like to preserve your tf-state online
     backend "local" {}
  required_providers {
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

# Data Lake Bucket
# Ref: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket
resource "google_storage_bucket" "data-lake-bucket" {
     # Concatenating DL bucket & Project name for unique naming
    name        = "${local.data_lake_bucket}_${var.project}"
    location    = var.region

    # Optional, but recommended settings:
    storage_class = var.storage_class
    uniform_bucket_level_access = true

    versioning {
        enabled = true
    }

    lifecycle_rule {
        action {
            type = "Delete"
        }
        condition {
            age = 30 // days
        }

        force_destroy = true
    }
}

# DWH
# Ref: https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset
resource "google_bigquery_dataset" "dataset" {
    dataset_id  = var.BQ.dataset
    project     = var.project 
    location    = var.region
}

}