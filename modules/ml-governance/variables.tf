variable "project_id" {
  description = "The GCP Project ID"
  type        = string
}

variable "region" {
  default = "us-east1"
}

variable "kms_key" {
  description = "Encryption key for HIPAA/FERPA compliance"
  type        = string
}
