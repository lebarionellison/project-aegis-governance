# modules/gcp-ml-governance/main.tf

# 1. Secure Storage for Training Data (FERPA/SOC2 compliant)
resource "google_storage_bucket" "ml_data_lake" {
  name          = "aegis-ml-data-${var.project_id}"
  location      = var.region
  public_access_prevention = "enforced"

  versioning {
    enabled = true
  }

  encryption {
    default_kms_key_name = var.kms_key
  }
}

# 2. Compute Resource Guardrail (FinOps usage reporting)
resource "google_project_usage_export_bucket" "usage_report" {
  bucket_name = google_storage_bucket.ml_data_lake.name
  prefix      = "usage-reports/ai-compute/"
}
