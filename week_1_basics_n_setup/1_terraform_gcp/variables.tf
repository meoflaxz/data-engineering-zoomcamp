locals {
    data_lake_bucket = "dtc_data_lake"
}

variable "project" {
    description = "Your GCP Project ID"
}

variable "region" {
    description = "Region for GCP resources"
    default = "us-central1"
    type = string
}

variable "storage_class" {
    description = "Storage class type for your bucket."
    default = "STANDARD"
}

variable "BQ_DATASET" {
    description = "BigQuery Dataset that raw data (from GCS) will be written to"
    type = string
    default = "mat_yoe_parey"
}

