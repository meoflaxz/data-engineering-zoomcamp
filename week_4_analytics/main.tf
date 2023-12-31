terraform {
    required_version = ">1.0"
    backend "local" {}

    required_providers {
        google = {
            source = "hashicorp/google"
        }
    }
}

provider "google" {
  project = "praxis-bond-408912"
  region  = "asia-southeast1"
  zone    = "asia-southeast1-a"
}


resource "google_bigquery_dataset" "dataset" {
    dataset_id                  = "example_dataset"
    description                 = "This is a test description"
    location                    = "US"
}

# terraform import google_storage_bucket.bucket praxis-bond-408912/bucket-test124
resource "google_storage_bucket" "bucket" {
    name                        = "bucket-test124"
    project                     = "praxis-bond-408912"
    location                    = "US"
}

resource "google_bigquery_table" "table" {
    dataset_id                  = google_bigquery_dataset.dataset.dataset_id
    table_id                    = "example_table"

# checking later for data pulling from external sources
    # external_data_configuration {
    #     autodetect              = true
    #     source_format           = "CSV"
    #     source_uris             = ["gs://${google_storage_bucket.bucket.name}/*.csv"]

    #     csv_options {
    #         encoding            = "UTF-8"
    #         quote               = ""
    #     }
    # }

    schema = <<EOF
    [
        {
            "name": "Date",
            "type": "STRING",
            "mode": "NULLABLE",
            "description": "Date"
        },
        {
            "name": "State",
            "type": "STRING",
            "mode": "NULLABLE",
            "description": "State"  
        },
        {
            "name": "Mean Income RM",
            "type": "STRING",
            "mode": "NULLABLE",
            "description": "Mean of income in RM" 
        },
        {
            "name": "Median Income RM",
            "type": "STRING",
            "mode": "NULLABLE",
            "description": "Median of income in RM"
        },
        {
            "name": "Mean Expenditure RM",
            "type": "STRING",
            "mode": "NULLABLE",
            "description": "Mean of expenditure in RM"            
        },
        {
            "name": "Gini Coefficient",
            "type": "STRING",
            "mode": "NULLABLE",
            "description": "Coefficient of Gini"            
        },
        {
            "name": "Poverty Rate",
            "type": "STRING",
            "mode": "NULLABLE",
            "description": "Rate poverty"             
        }
    ]
EOF
}
