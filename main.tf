module "ml_security_layer" {
  source     = "./modules/ml-governance"
  project_id = "your-gcp-project-id"
  kms_key    = "your-security-key"
}
